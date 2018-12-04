class TestCase
  attr_accessor :name

  def initialize name
    self.name = name
  end

  def run
    self.set_up
    method = self.name
    self.send(method)
    self.tear_down
  end

  def tear_down

  end

end

class WasRun < TestCase

  attr_accessor :was_run, :log

  def initialize name
    super name
  end

  def set_up
    self.log = "set_up "
  end

  def test_method
    self.log = self.log + "test_method "
  end

  def tear_down
    self.log = self.log + "tear_down "
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

  def test_template_method
    self.test.run
    assert {self.test.log == "set_up test_method tear_down "}
  end
end

TestCaseTest.new("test_template_method").run
