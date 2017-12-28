require 'uri'
require 'net/http'
require 'openssl'
require 'json'

load 'vars.rb'

url = URI(NEST_STAT_SPECIFIC_URL)

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Put.new(url)
request["authorization"] = AUTH_ID
request["content-type"] = 'application/json'
request.body = "{\"target_temperature_c\": #{TARGET_TEMP}}"

response = http.request(request)

p response.code
parsed = JSON.parse(response.body)

p parsed["target_temperature_c"]
