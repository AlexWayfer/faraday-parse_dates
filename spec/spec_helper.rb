# frozen_string_literal: true

require 'pry-byebug'

require 'faraday'

require 'simplecov'

if ENV['CI']
  require 'simplecov-cobertura'
  SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter
end

SimpleCov.start

require_relative '../lib/faraday/parse_dates'

module ResponseMiddlewareExampleGroup
  def self.included(base)
    base.let(:options) { {} }
    base.let(:headers) { {} }
    base.let(:middleware) do
      described_class.new(lambda { |env|
        Faraday::Response.new(env)
      }, options)
    end
  end

  def process(body, content_type = nil, options = {})
    env = {
      body: body, request: options,
      request_headers: Faraday::Utils::Headers.new,
      response_headers: Faraday::Utils::Headers.new(headers)
    }
    env[:response_headers]['content-type'] = content_type if content_type
    yield(env) if block_given?
    middleware.call Faraday::Env.from(env)
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = :random

  config.include ResponseMiddlewareExampleGroup, type: :response
end
