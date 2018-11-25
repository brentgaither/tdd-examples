require 'expression'
class Sum < Expression

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def augend
    @augend
  end

  def addend
    @addend
  end

  def reduce(bank, to)
    Money.new(augend.reduce(bank, to).amount + addend.reduce(bank, to).amount, to)
  end

  def plus(addend)
    Sum.new(self, addend)
  end

  def times(multiplier)
    Sum.new(augend.times(multiplier), addend.times(multiplier))
  end

end
