# The Overdraft class
class Overdraft
  attr_reader :default_limit, :customer_limit

  def initialize
    @default_limit = 0
    @customer_limit = 0
  end

  def new_limit(limit)
    @customer_limit = limit
  end
end
