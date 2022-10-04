# frozen_string_literal: true

include :bundler, static: true

require 'gem_toys'
expand GemToys::Template

alias_tool :g, :gem

tool :console do
  def run
    require_relative 'lib/faraday/parse_dates'

    require 'pry'
    Pry.start
  end
end

alias_tool :c, :console