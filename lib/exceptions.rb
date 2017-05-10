# frozen_string_literal: true

module Exceptions
  # Generic Expection class to the system
  class TimeChallengeException < RuntimeError
    attr_accessor :message

    def initialize(message)
      self.message = message
    end
  end
end
