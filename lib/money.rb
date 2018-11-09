class Money

  attr_reader :amount #This is not protected like it could be with a railsy attr_protected

  def ==(object)
    @amount == object.amount && self.class == object.class
  end
end
