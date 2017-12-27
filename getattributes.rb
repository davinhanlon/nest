require 'uri'
require 'net/http'
require 'openssl'
require 'json'

thermostatid = 'wRFYwmAT7rFQ1auMNYlpNzr2E_7Duxt8'
url = URI("https://firebase-apiserver20-tah01-iad01.dapi.production.nest.com:9553")
authid = 'Bearer c.p5RAFUUnFqmAaqypUqblXzlfxi1Hlov1bAglvFm6Lbm6mrEJJq2Eiy81DcAwlnFDKULKxmghxmUvyJNvjedNAlcRGBBlGMPxfc3TOkmeY38LHq4cQJGTW0ebFVADnoHskkfjw1sTTxGEapfa'

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
