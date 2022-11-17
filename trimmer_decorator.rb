require_relative './base_decorator.rb'
class TrimDecorator < BaseDecorator
  def correct_name
    @nameablestore.correct_name[0..10] if
    @nameablestore.correct_name.length > 10
  end
end
