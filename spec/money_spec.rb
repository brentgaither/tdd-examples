require 'money'
require 'bank'

RSpec.describe TddExamples do
  it "should not allow different types of money to equal each other" do
    expect(Money.dollar(10)==Money.franc(10)).to be false
  end

  context "multiply" do
    it "should work for dollars" do
      five = Money.dollar(5)
      expect(Money.dollar(10)==five.times(2)).to be true
      expect(Money.dollar(15)==five.times(3)).to be true
    end

    it 'should reduce' do
      five_bucks = Money.dollar(5)
      ten_francs = Money.franc(10)
      bank = Bank.new
      bank.add_rate("CHF", "USD", 2)
      sum = Sum.new(five_bucks, ten_francs).times(2)
      result = bank.reduce(sum, "USD")
      expect(result == Money.dollar(20)).to be true
    end
  end

  it 'should compare equal objects' do
    expect(Money.franc(5)==(Money.franc(5))).to be true
    expect(Money.franc(5)==(Money.franc(6))).to be false
  end

  it 'should have a currency' do
    expect(Money.franc(1).currency).to eq("CHF")
  end

  it 'should compare equal objects' do
    expect(Money.dollar(5)==(Money.dollar(5))).to be true
    expect(Money.dollar(5)==(Money.dollar(6))).to be false
  end

  it 'should have a currency' do
    expect(Money.dollar(1).currency).to eq("USD")
  end

  context 'addition' do
    it 'should add money' do
      five = Money.dollar(5)
      sum = five.plus(Money.dollar(5))
      reduced = Bank.new.reduce(sum, "USD")
      expect(Money.dollar(10)).to eq(reduced)
    end

    it 'should return a sum' do
      five = Money.dollar(5)
      result = five.plus(five)
      expect(result.augend).to eq five
      expect(result.addend).to eq five
    end

    it 'should add the same currency' do
      sum = Money.dollar(1).plus(Money.dollar(1))
      expect(sum.is_a? Money)
    end
  end

  context 'conversions' do
    it 'should add mixed currencies' do
      five_bucks = Money.dollar(5)
      ten_francs = Money.franc(10)
      bank = Bank.new
      bank.add_rate("CHF", "USD", 2)
      result = bank.reduce(five_bucks.plus(ten_francs), "USD")
      expect(result == Money.dollar(10)).to be true
    end
  end

  context 'sum' do
    it 'sums money' do
      five_bucks = Money.dollar(5)
      ten_francs = Money.franc(10)
      bank = Bank.new
      bank.add_rate("CHF", "USD", 2)
      sum = Sum.new(five_bucks, ten_francs).plus(five_bucks)
      result = bank.reduce(sum, "USD")
      expect(result == Money.dollar(15)).to be true
    end
  end
end
