# Faraday Parse Dates

[![Cirrus CI - Base Branch Build Status](https://img.shields.io/cirrus/github/AlexWayfer/faraday-parse_dates?style=flat-square)](https://cirrus-ci.com/github/AlexWayfer/faraday-parse_dates)
[![Codecov branch](https://img.shields.io/codecov/c/github/AlexWayfer/faraday-parse_dates/main.svg?style=flat-square)](https://codecov.io/gh/AlexWayfer/faraday-parse_dates)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/AlexWayfer/faraday-parse_dates.svg?style=flat-square)](https://codeclimate.com/github/AlexWayfer/faraday-parse_dates)
[![Depfu](https://img.shields.io/depfu/AlexWayfer/faraday-parse_dates?style=flat-square)](https://depfu.com/repos/github/AlexWayfer/faraday-parse_dates)
[![Inline docs](https://inch-ci.org/github/AlexWayfer/faraday-parse_dates.svg?branch=main)](https://inch-ci.org/github/AlexWayfer/faraday-parse_dates)
[![Gem](https://img.shields.io/gem/v/faraday-parse_dates.svg?style=flat-square)](https://rubygems.org/gems/faraday-parse_dates)
[![License](https://img.shields.io/github/license/AlexWayfer/faraday-parse_dates.svg?style=flat-square)](LICENSE.md)

Parse dates from response.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'faraday-parse_dates'
```

And then execute:

```shell
bundle install
```

Or install it yourself as:

```shell
gem install faraday-parse_dates
```

## Usage

```ruby
require 'faraday/parse_dates'

connection = Faraday.new do |faraday|
  ## This gem only decodes responses
  faraday.response :parse_dates

  ## Alternatively, you can use `use`
  # faraday.use :parse_dates
end
```

### Order note

It can doesn't work being placed after `faraday.response :json` or similar middlewares,
but can work before them. Check the order and results.

The issue about this: <https://github.com/lostisland/faraday/issues/1458>

And please read middlewares documentation carefully: <https://lostisland.github.io/faraday/middleware/>

## Development

After checking out the repo, run `bin/setup` to install dependencies.

Then, run `bin/test` to run the tests.

To install this gem onto your local machine, run `toys gem install`.

To release a new version, run `toys gem release %version%`.
See how it works [here](https://github.com/AlexWayfer/gem_toys#release).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/AlexWayfer/faraday-parse_dates).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
