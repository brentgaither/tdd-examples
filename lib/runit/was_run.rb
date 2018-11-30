class TestCase
  attr_accessor :name

  def initialize name
    self.name = name
  end

  def run
    method = self.name
    self.send(method)
  end
end

class WasRun < TestCase

  attr_accessor :was_run

  def initialize name
    self.was_run = nil
    super name
  end

  def test_method()
    self.was_run = 1
  end
end


def assert &block
  raise RuntimeError unless yield
end

class TestCaseTest < TestCase
  def test_running
    test = WasRun.new "test_method"
    assert {!test.was_run}
    test.run
    assert {test.was_run}
  end
end

TestCaseTest.new("test_running").run
