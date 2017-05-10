# frozen_string_literal: true

class Report
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def publish
    ranking.each_with_index do |(caller, cost), index|
      puts "Caller #{caller} should pay #{cost.round(2)} #{extra_info(index)}"
    end
  end

  def ranking
    data.sort_by { |_, cost| cost }.reverse
  end

  private

  def extra_info(index)
    '(not to be charged)' if index.zero?
  end
end
