require_relative 'nameable'

class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.upcase
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    if @nameable.correct_name.length > 10
      @nameable.correct_name.slice(0, 10)
    else
      @nameable.correct_name
    end
  end
end
