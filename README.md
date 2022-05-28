# Faraday Parse Dates

[![Cirrus CI - Base Branch Build Status](https://img.shields.io/cirrus/github/AlexWayfer/faraday-parse_dates?style=flat-square)](https://cirrus-ci.com/github/AlexWayfer/faraday-parse_dates)
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
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.

Then, run `bin/test` to run the tests.

To install this gem onto your local machine, run `rake build`.

To release a new version, make a commit with a message such as "Bumped to 0.0.2" and then run `rake release`.
See how it works [here](https://bundler.io/guides/creating_gem.html#releasing-the-gem).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/AlexWayfer/faraday-parse_dates).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
