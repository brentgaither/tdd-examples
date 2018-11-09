require 'money'
require 'franc'

RSpec.describe TddExamples do
  it "should not allow different types of money to equal each other" do
    expect(Dollar.new(10)==Franc.new(10)).to be false
  end

  context "should multiply" do
    it "should work for dollars" do
      five = Money.dollar(5)
      expect(Money.dollar(10)==five.times(2)).to be true
      expect(Money.dollar(15)==five.times(3)).to be true
    end

    it "should work for francs" do
      five = Money.franc(5)
      expect(Money.franc(10)==five.times(2)).to be true
      expect(Money.franc(15)==five.times(3)).to be true
    end
  end
end
