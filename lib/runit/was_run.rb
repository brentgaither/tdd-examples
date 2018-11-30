class TestCase
  attr_accessor :name

  def initialize name
    self.name = name
  end

  def run
    self.set_up
    method = self.name
    self.send(method)
  end

end

class WasRun < TestCase

  attr_accessor :was_run, :was_set_up

  def initialize name
    self.was_run = nil
    super name
  end

  def test_method()
    self.was_run = 1
  end

  def set_up
    self.was_run = nil
    self.was_set_up = 1
  end
end


def assert &block
  raise RuntimeError unless yield
end

class TestCaseTest < TestCase

  attr_accessor :test
  def set_up
    self.test = WasRun.new "test_method"
  end

  def test_running
    self.test.run
    assert {test.was_run}
  end

  def test_set_up
    self.test.run
    assert {test.was_set_up}
  end
end

TestCaseTest.new("test_running").run
TestCaseTest.new("test_set_up").run
