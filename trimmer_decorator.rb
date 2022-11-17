require_relative './base_decorator'
class TrimDecorator < BaseDecorator
  def correct_name
    @nameablestore.correct_name[0..9] if
    @nameablestore.correct_name.length > 10
  end
end
