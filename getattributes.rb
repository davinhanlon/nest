require 'uri'
require 'net/http'
require 'openssl'
require 'json'

load 'vars.rb'

url = URI(NEST_BASE_URL)
thermostatid = STAT_ID
authid = AUTH_ID

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["content"] = 'application/json'
request["authorization"] = authid

response = http.request(request)

p response.code
parsed = JSON.parse(response.body)
p parsed["devices"]["thermostats"][thermostatid]["target_temperature_c"]
p parsed["devices"]["thermostats"][thermostatid]["name"]
p parsed["devices"]["thermostats"][thermostatid]["humidity"]
