class Nameable
  def initialize(name)
    @name = name
  end

  def correct_name()
    raise NotImplementedError, "method 'correct_name' must be implemented in a subclass"
  end
end
