# frozen_string_literal: true

require 'faraday'

require_relative 'parse_dates/middleware'
require_relative 'parse_dates/version'

module Faraday
  # This will be your middleware main module, though the actual middleware implementation will go
  # into Faraday::ParseDates::Middleware for the correct namespacing.
  module ParseDates
    # Faraday allows you to register your middleware for easier configuration.
    # This step is totally optional, but it basically allows users to use a
    # custom symbol (in this case, `:parse_dates`), to use your middleware in their connections.
    # After calling this line, the following are both valid ways to set the middleware in a connection:
    # * conn.use Faraday::ParseDates::Middleware
    # * conn.use :parse_dates
    # Without this line, only the former method is valid.
    Faraday::Middleware.register_middleware(parse_dates: Faraday::ParseDates::Middleware)

    # Alternatively, you can register your middleware under Faraday::Request or Faraday::Response.
    # This will allow to load your middleware using the `request` or `response` methods respectively.
    #
    # Load middleware with conn.request :parse_dates
    # Faraday::Request.register_middleware(parse_dates: Faraday::ParseDates::Middleware)
    #
    # Load middleware with conn.response :parse_dates
    Faraday::Response.register_middleware(parse_dates: Faraday::ParseDates::Middleware)
  end
end
