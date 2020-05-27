require 'pry'
require 'net/http'
require 'json'
require 'open-uri'

# require "rickandmorty/version"
require_relative "./rickandmorty/cli"
require_relative "./rickandmorty/character"
require_relative "./rickandmorty/api"
require_relative "./rickandmorty/location"
require_relative "./rickandmorty/episode"

module Rickandmorty
  class Error < StandardError; end
  # Your code goes here...
end
