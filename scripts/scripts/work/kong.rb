require 'json'
require 'net/http'
require "uri"

uri = URI.parse "http://localhost:18001/plugins"
jres = JSON.parse Net::HTTP.get_response(uri)

## delete all plugins
http = HTTP.new(uri.host, uri.port)
http = Net::HTTP.new(uri.host, uri.port)
jres['data'].each { |k| http.request(Net::HTTP::Delete.new("/plugins/#{k.id}")) }
