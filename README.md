# Faraday Parse Dates

[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/AlexWayfer/faraday-parse_dates/ci.yml?branch=main&style=flat-square)](https://github.com/AlexWayfer/faraday-parse_dates/actions/workflows/ci.yml)
[![Codecov branch](https://img.shields.io/codecov/c/github/AlexWayfer/faraday-parse_dates/main.svg?style=flat-square)](https://codecov.io/gh/AlexWayfer/faraday-parse_dates)
[![Qlty maintainability](https://qlty.sh/gh/AlexWayfer/projects/faraday-parse_dates/maintainability.svg)](https://qlty.sh/gh/AlexWayfer/projects/faraday-parse_dates)
[![Depfu](https://img.shields.io/depfu/AlexWayfer/faraday-parse_dates?style=flat-square)](https://depfu.com/repos/github/AlexWayfer/faraday-parse_dates)
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

### Publishing this gem

This repository sets `publish_gem: false`: Toys prepares the version, dated changelog,
commit, and tag, and GitHub Actions publishes the gem when a `v*` tag is pushed.
The workflow checks the tag against the gem version and dated changelog, runs the checks,
and builds the gem before publishing.

Before the first automated release, configure a
[RubyGems trusted publisher](https://guides.rubygems.org/trusted-publishing/)
for `faraday-parse_dates` with these values:

*   Repository owner: `AlexWayfer`
*   Repository name: `faraday-parse_dates`
*   Workflow filename: `release.yml`
*   Environment: `release`

No RubyGems API key is stored in GitHub secrets. After a failed release, fix the cause and
re-run the failed workflow jobs for the same tag.

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/AlexWayfer/faraday-parse_dates).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
