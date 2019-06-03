#!/usr/bin/env ruby
require 'pry'
require 'terminal-table'
require_relative "./parser.rb"


def run
test=Parser.new("./webserver.log")
test.get_log
end


run
