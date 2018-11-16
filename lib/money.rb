require 'expression'
require 'sum'

class Money < Expression

  attr_reader :amount, :currency

  def initialize (amount, currency)
    @amount = amount
    @currency = currency
  end

  def ==(object)
    @amount == object.amount && self.currency == object.currency
  end

  def times(multiplier)
    Money.new(@amount * multiplier, currency)
  end

  def plus(addend)
    Sum.new(self, addend)
  end

  def self.dollar(amount)
    @currency = "USD"
    Money.new(amount, currency)
  end

  def self.franc(amount)
    @currency = "CHF"
    Money.new(amount, currency)
  end

  def self.currency
    return @currency
  end

  def reduce(bank, to)
    rate = bank.rate(currency, to)
    Money.new(amount / rate, to)
  end
end
