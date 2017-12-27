
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

url = URI("https://firebase-apiserver20-tah01-iad01.dapi.production.nest.com:9553/devices/thermostats/wRFYwmAT7rFQ1auMNYlpNzr2E_7Duxt8")
authid = 'Bearer c.p5RAFUUnFqmAaqypUqblXzlfxi1Hlov1bAglvFm6Lbm6mrEJJq2Eiy81DcAwlnFDKULKxmghxmUvyJNvjedNAlcRGBBlGMPxfc3TOkmeY38LHq4cQJGTW0ebFVADnoHskkfjw1sTTxGEapfa'
targettemp = '24'

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
