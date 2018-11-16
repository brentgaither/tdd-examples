require 'money'

class Franc < Money

  def initialize (amount, currency)
    super(amount, currency)
  end

  def times(multiplier)
    Money.franc(@amount * multiplier)
  end

  def currency
    "CHF"
  end

end
