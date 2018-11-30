class WasRun

  attr_accessor :was_run
  def initialize(name)
    self.was_run = nil
  end

  def test_method()
    self.was_run = 1
  end
end



test = WasRun.new "testMethod"
p test.was_run
test.test_method
p test.was_run
