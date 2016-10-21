require 'json'
require 'net/http'
require "uri"
require 'ostruct'
require "pry"


$new_kong = 'http://localhost:18001'
$old_kong = 'http://localhost:8001'


# uri = URI.parse "http://localhost:18001/plugins"
# jres = JSON.parse Net::HTTP.get_response(uri)

## delete all plugins
# http = HTTP.new(uri.host, uri.port)
# http = Net::HTTP.new(uri.host, uri.port)
# jres['data'].each { |k| http.request(Net::HTTP::Delete.new("/plugins/#{k.id}")) }
##
# old_plugins['data'].map { |plugin| plugin["api_id"] if plugin["name"] == "key-auth" }.compact.map { |api_id|
#   JSON.parse(Net::HTTP.get_response(URI::parse("http://localhost:8001/apis/#{api_id}")).body)["name"] }

def add_consumer(custom_id, username)
  uri = URI('http://localhost:18001/consumers')
  payload = { custom_id: custom_id }
  payload['username'] = username if username
  res = JSON.parse(Net::HTTP.post_form(uri, payload).body)
  id = res['id']
  puts "created consumer #{custom_id}/#{username} with id #{id}"
  id
end

def add_consumer_keys(consumer) 
  consumer_id = add_consumer(consumer.custom_id, consumer.username)

  if !consumer.keys.empty?                 
    consumer.keys.each { |key|
      puts "Creating key for consumer #{consumer.custom_id}: #{key['key']}"
      uri = URI("#{$new_kong}/consumers/#{consumer_id}/key-auth")
      res = JSON.parse(Net::HTTP.post_form(uri, key: key['key']).body)
      puts "response: #{res['id']}"
    }
  end
end


def delete_resource(type, id)
  uri = URI($new_kong)
  http = Net::HTTP.new(uri.host, uri.port)
  response = http.request(Net::HTTP::Delete.new("/#{type}/#{id}"))
  puts "response deleting resource #{type} with id #{id}: #{response.code}"
end

# start with a clean slate, delete existing consumers on new kong
existing_consumers = JSON.parse(Net::HTTP.get_response(URI::parse("#{$new_kong}/consumers?size=500")).body)['data']
puts "Found #{existing_consumers.count} consumers"
existing_consumers.map { |existing|
  delete_resource("consumers", existing['id'])
}
  


# find all current consumers on old kong
consumers = JSON.parse(Net::HTTP.get_response(URI::parse("#{$old_kong}/consumers?size=500")).body)['data']
consumers.map { |c|
  auth_keys = JSON.parse(Net::HTTP.get_response(
                    URI::parse("#{$old_kong}/consumers/#{c['id']}/key-auth")).body)
    consumer = OpenStruct.new(custom_id: c['custom_id'], username: c['username'], keys: auth_keys['data'])
    add_consumer_keys(consumer)
}
