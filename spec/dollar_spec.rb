require 'dollar'

RSpec.describe TddExamples do
  it "multiples dollar amounts" do
    five = Money.dollar(5)
    expect(Money.dollar(10)).to eq(five.times(2))
    expect(Money.dollar(15)).to eq(five.times(3))
  end

  it 'should compare equal objects' do
    expect(Money.dollar(5)==(Money.dollar(5))).to be true
    expect(Money.dollar(5)==(Money.dollar(6))).to be false
  end

  it 'should have a currency' do
    expect(Money.dollar(1).currency).to eq("USD")
  end
end
