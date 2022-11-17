require_relative './base_decorator.rb'
class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameablestore.correct_name.capitalize
    super.capitalize
  end
end
