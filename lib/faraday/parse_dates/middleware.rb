# frozen_string_literal: true

require 'time'

module Faraday
  module ParseDates
    # This class provides the main implementation for your middleware.
    # Your middleware can implement any of the following methods:
    # * on_request - called when the request is being prepared
    # * on_complete - called when the response is being processed
    #
    # Optionally, you can also override the following methods from Faraday::Middleware
    # * initialize(app, options = {}) - the initializer method
    # * call(env) - the main middleware invocation method.
    #   This already calls on_request and on_complete, so you normally don't need to override it.
    #   You may need to in case you need to "wrap" the request or need more control
    #   (see "retry" middleware: https://github.com/lostisland/faraday/blob/main/lib/faraday/request/retry.rb#L142).
    #   IMPORTANT: Remember to call `@app.call(env)` or `super` to not interrupt the middleware chain!
    class Middleware < Faraday::Middleware
      ISO_DATE_FORMAT = /\A\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\.\d+)?(Z|((\+|-)\d{2}:?\d{2}))\Z/xm.freeze

      def initialize(app, options = {})
        @regexp = options[:match] || ISO_DATE_FORMAT
        super(app)
      end

      # This method will be called when the response is being processed.
      # You can alter it as you like, accessing things like response_body, response_headers, and more.
      # Refer to Faraday::Env for a list of accessible fields:
      # https://github.com/lostisland/faraday/blob/main/lib/faraday/options/env.rb
      #
      # @param env [Faraday::Env] the environment of the response being processed.
      def on_complete(env)
        parse_dates! env[:body]
      end

      private

      def parse_dates!(value)
        case value
        when Hash
          value.each { |key, element| value[key] = parse_dates!(element) }
        when Array
          value.each_with_index { |element, index| value[index] = parse_dates!(element) }
        when @regexp
          Time.parse(value)
        else
          value
        end
      end
    end
  end
end
