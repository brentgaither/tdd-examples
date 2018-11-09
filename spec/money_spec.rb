require 'money'
require 'franc'

RSpec.describe TddExamples do
  it "should not allow different types of money to equal each other" do
    expect(Dollar.new(10)==Franc.new(10)).to be false
  end
end
