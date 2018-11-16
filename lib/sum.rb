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

  def reduce(to)
    Money.new(augend.amount + addend.amount, to)
  end

end
