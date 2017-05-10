# frozen_string_literal: true

class Collector
  attr_reader :calls

  def initialize(calls)
    @calls = calls
  end

  def charge
    return if calls.nil?

    calls.each_with_object({}) do |call, hash|
      hash[call.from] = (hash[call.from] || 0) + call.cost
    end
  end
end
