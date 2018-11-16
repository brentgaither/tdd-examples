require 'money'

class Dollar < Money

  def initialize (amount, currency)
    super(amount, currency)
  end


  def currency
    "USD"
  end
end
