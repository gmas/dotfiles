#! /usr/bin/env ruby

require 'strscan'
require 'pry'
require 'pathname'


config_file = ARGV.first
STDERR.puts "Parsing #{config_file}"

pname = Pathname.new(config_file)
file_name = pname.basename
# file_loc = pname.dirname
# STDERR.puts file_name, file_loc

input = File.open("#{config_file}", "rb")
contents = input.read

def extract_tags(text)
  tags = [ "ca", "cert", "key", "tls-auth" ]
  results = {}
  scanner = StringScanner.new(text)

  # extract_tags
  tags.each do |tag|
    scanner.reset
    tag_start = scanner.skip_until(/<#{tag}>/) - (tag.length + 2)
    tag_end = tag_start + scanner.skip_until(/<\/#{tag}>/) + tag.length + 3
    results[tag] = text.slice!(tag_start..tag_end)
  end
  results 
end

def clean_tags(tag, text)
  text.gsub(/<\/*#{tag}>/, '').gsub(/^$\n/, '')
end

results = extract_tags(contents) #.map {|el| clean_tags(el) }
# puts results.inspect

certs_dir = File.join(Dir.pwd, file_name)
Dir.mkdir(certs_dir, 0700) unless File.exists?(certs_dir)

results.each do |k,v|
  File.open(File.join(Dir.pwd, file_name, k), 'w+') {
    |f| f.write(clean_tags(k, v))
  }
end

puts contents 


# add refs to certs/keys files
#   ca /home/george/ovpn/ca.crt
#   cert /home/george/ovpn/cert.crt
#   key /home/george/ovpn/client.key
#   tls-auth /home/george/ovpn/ta.key
# save contents to new .ovpn file

def save_tag(tag_vals)
  # strip first line
  # strip last line
  # save to file tag_vals[0]
end
