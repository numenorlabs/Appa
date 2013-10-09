#!/usr/bin/env ruby

require 'appa_workstation'

command = ARGV.shift

case command
when 'workstation'
  action = ARGV.shift
  workstation(action)
else
  if command
    puts "Command #{command} not understood."
  else
    puts 'No command given.'
  end
end
