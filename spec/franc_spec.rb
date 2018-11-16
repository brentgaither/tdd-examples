require 'franc'

RSpec.describe TddExamples do
  it "multiples franc amounts" do
    five = Money.franc(5)
    expect(Money.franc(10)).to eq(five.times(2))
    expect(Money.franc(15)).to eq(five.times(3))
  end

  it 'should compare equal objects' do
    expect(Money.franc(5)==(Money.franc(5))).to be true
    expect(Money.franc(5)==(Money.franc(6))).to be false
  end

  it 'should have a currency' do
    expect(Money.franc(1).currency).to eq("CHF")
  end
end
