#!/usr/bin/env ruby

puts "#{ARGF.argv}"
File.open("/tmp/acpi.log", "a+") { |fl|
  fl << ARGF.argv
}

on_battery = lambda { 
  puts "on_battery"
	File.open("/tmp/on_battery", "w") {}
}

on_plugged = lambda {
  puts "on_ac"
	File.delete("/tmp/on_battery") rescue Errno::ENOENT
}

battery_events = {
	["ac_adapter", "ACPI0003:00", "00000080", "00000000"] => on_battery ,
	["ac_adapter", "ACPI0003:00", "00000080", "00000001"] => on_plugged 
}

if (result = battery_events.find { |k,v| k == ARGF.argv })
	result[1].call
end
