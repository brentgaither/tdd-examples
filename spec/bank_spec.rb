require 'money'
require 'bank'

RSpec.describe Bank do
  context 'reduce' do
    it 'should return the correct currency' do
      sum = Sum.new(Money.dollar(3), Money.dollar(4))
      result = Bank.new.reduce(sum, "USD")
      expect(Money.dollar(7)).to eq result
    end
  end
end
