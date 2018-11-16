require 'money'

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
      sum = Money.dollar(5).plus(Money.dollar(5))
      expect(Money.dollar(10)).to eq(sum)
    end
  end
end
