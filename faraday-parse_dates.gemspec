# frozen_string_literal: true

require_relative 'lib/faraday/parse_dates/version'

Gem::Specification.new do |spec|
  spec.name = 'faraday-parse_dates'
  spec.version = Faraday::ParseDates::VERSION
  spec.authors = ['Alexander Popov']
  spec.email = ['alex.wayfer@gmail.com']

  spec.summary = 'Parse dates from response.'
  spec.description = <<~DESC
    Parse dates from response.
  DESC
  spec.license = 'MIT'

  github_uri = "https://github.com/AlexWayfer/#{spec.name}"

  spec.homepage = github_uri

  spec.metadata = {
    'bug_tracker_uri' => "#{github_uri}/issues",
    'changelog_uri' => "#{github_uri}/blob/v#{spec.version}/CHANGELOG.md",
    'documentation_uri' => "http://www.rubydoc.info/gems/#{spec.name}/#{spec.version}",
    'homepage_uri' => spec.homepage,
    'rubygems_mfa_required' => 'true',
    'source_code_uri' => github_uri,
    'wiki_uri' => "#{github_uri}/wiki"
  }

  spec.files = Dir['lib/**/*', 'README.md', 'LICENSE.md', 'CHANGELOG.md']

  spec.required_ruby_version = '>= 3.0', '< 4'

  spec.add_runtime_dependency 'faraday', '~> 2.9.0'
end
