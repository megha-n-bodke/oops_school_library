require_relative './nameable'
class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameablestore = nameable
  end

  def correct_name
    # The Decorator delegates all work to the wrapped component.
    @nameablestore.correct_name
  end
end
