# frozen_string_literal: true

require 'time'
class Call
  attr_reader :start, :finish, :from, :to

  FIVE_MIN_IN_SEC = 300

  def initialize(args)
    @start = Time.parse(args[0])
    @finish = Time.parse(args[1])
    @from = args[2]
    @to = args[3]

    validate_dates
  end

  def cost
    _cost(duration_in_sec, 0)
  end

  def duration_in_sec
    finish - start
  end

  private

  def _cost(duration, acc)
    return acc if duration <= 0

    acc += (duration <= FIVE_MIN_IN_SEC ? 0.5 : 0.2)
    _cost(duration - 60, acc)
  end

  def validate_dates
    return if start <= finish
    raise Exceptions::TimeChallengeException, 'Error: start time cannot be bigger than finish time'
  end
end
