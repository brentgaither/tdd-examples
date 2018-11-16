class Money

  attr_reader :amount, :currency

  def initialize (amount, currency)
    @amount = amount
    @currency = currency
  end

  def ==(object)
    @amount == object.amount && self.class == object.class
  end

  def self.dollar(amount)
    @currency = "USD"
    Dollar.new(amount, currency)
  end

  def self.franc(amount)
    @currency = "CHF"
    Franc.new(amount, currency)
  end

  def self.currency
    return @currency
  end
end
