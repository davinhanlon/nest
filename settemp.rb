
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

load 'vars.rb'

url = URI(NEST_STAT_SPECIFIC_URL)

authid = AUTH_ID
targettemp = TARGET_TEMP

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Put.new(url)
request["authorization"] = authid
request["content-type"] = 'application/json'
request.body = "{\"target_temperature_c\": #{targettemp}}"

response = http.request(request)
p response.code

parsed = JSON.parse(response.body)
p parsed["target_temperature_c"]
