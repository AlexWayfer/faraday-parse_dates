# frozen_string_literal: true

include :bundler, static: true

require 'gem_toys'
expand GemToys::Template

tool :g, delegate_relative: :gem

tool :console do
  def run
    require_relative 'lib/faraday/parse_dates'

    require 'pry'
    Pry.start
  end
end

tool :c, delegate_relative: :console
