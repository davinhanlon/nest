require 'uri'
require 'net/http'
require 'openssl'
require 'json'

load 'variables.rb'

url = URI(NEST_BASE_URL)

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["content"] = 'application/json'
request["authorization"] = AUTH_ID

response = http.request(request)

p response.code
parsed = JSON.parse(response.body)

p parsed["devices"]["thermostats"][STAT_ID]["target_temperature_c"]
p parsed["devices"]["thermostats"][STAT_ID]["name"]
p parsed["devices"]["thermostats"][STAT_ID]["humidity"]
