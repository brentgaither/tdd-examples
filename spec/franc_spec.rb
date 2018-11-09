require 'franc'

RSpec.describe TddExamples do
  it "multiples franc amounts" do
    five = Franc.new(5)
    expect(Franc.new(10)).to eq(five.times(2))
    expect(Franc.new(15)).to eq(five.times(3))
  end

  it 'should compare equal objects' do
    expect(Franc.new(5)==(Franc.new(5))).to be true
    expect(Franc.new(5)==(Franc.new(6))).to be false
  end
end
