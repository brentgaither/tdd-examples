require 'money_example/money'
require 'money_example/bank'

RSpec.describe Bank do
  context 'reduce' do
    it 'should return the correct currency' do
      sum = Sum.new(Money.dollar(3), Money.dollar(4))
      result = Bank.new.reduce(sum, "USD")
      expect(Money.dollar(7)).to eq result
    end

    it 'should reduce different currencies' do
      bank = Bank.new
      bank.add_rate("CHF", "USD", 2)
      result = bank.reduce(Money.franc(2), "USD")
      expect(result).to eq(Money.dollar(1))
    end
  end
end
