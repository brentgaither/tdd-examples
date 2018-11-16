require 'expression'

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
end
