class Bank

  def initialize
    @rates = Hash.new
  end

  def reduce(source, to)
    source.reduce(self, to)
  end

  def rate(from, to)
    return 1 if(from == to)
    @rates[(from + to).to_sym]
  end

  def rates
    @rates
  end

  def add_rate(from, to, rate)
    @rates[(from + to).to_sym] = rate
  end
end
