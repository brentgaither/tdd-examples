require 'dollar'

RSpec.describe TddExamples do
  it "multiples dollar amounts" do
    five = Dollar.new(5)
    expect(Dollar.new(10)).to eq(five.times(2))
    expect(Dollar.new(15)).to eq(five.times(3))
  end

  it 'should compare equal objects' do
    expect(Dollar.new(5)==(Dollar.new(5))).to be true
    expect(Dollar.new(5)==(Dollar.new(6))).to be false
  end
end
