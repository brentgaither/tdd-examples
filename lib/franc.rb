class Dollar

  attr_reader :amount #This is not private like it could be with a railsy attr_protected

  def initialize (amount)
    @amount = amount
  end

  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end

  def ==(object)
    @amount == object.amount
  end
end
