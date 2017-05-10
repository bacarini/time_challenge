# frozen_string_literal: true

module Parser
  def self.parse(file)
    file.map do |line|
      params = line.chomp.split(';')
      raise_error(params) if params.empty? || params.size != 4

      Call.new(params)
    end
  end

  def self.raise_error(params)
    raise Exceptions::TimeChallengeException,
          "Error: There is something wrong with the file input - #{params.join(', ')}"
  end
end
