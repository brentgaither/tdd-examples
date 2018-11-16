require 'money'

class Expression
  def plus(addend)
    Money.new(amount + addend.amount, currency)
  end
end
