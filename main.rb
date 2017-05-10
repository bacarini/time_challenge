#!/usr/bin/env ruby
# frozen_string_literal: true

Dir['lib/**/*.rb'].each { |file| load file }

raise Exceptions::TimeChallengeException, 'Error: None file name was given' if ARGF.fileno.zero?

calls = Parser.parse(ARGF.readlines)
callers_to_charge = Collector.new(calls).charge
Report.new(callers_to_charge).publish
