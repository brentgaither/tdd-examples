require 'dollar'

RSpec.describe TddExamples do
  it "multiples dollar amounts" do
    five = Dollar.new(5)
    five.times(2)
    expect(five.amount).to eq(10)
  end
end
