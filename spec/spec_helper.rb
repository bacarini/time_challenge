# frozen_string_literal: true

lib_path = File.expand_path('../../lib', __FILE__)
Dir["#{lib_path}/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.expect_with :rspec
end
