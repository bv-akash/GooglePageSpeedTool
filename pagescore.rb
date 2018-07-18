require 'net/https'
require 'json'
require 'uri'


KEY = 'AIzaSyAnL_4p07YTsjkM--F0N2sLEEC4l2TXVck'
strategy = 'mobile'
domain = 'http://youtube.com/'
url = "https://www.googleapis.com/pagespeedonline/v4/runPagespeed?url=" + \
      URI.encode(domain) + \
      "&key=#{KEY}&strategy=#{strategy}"

uri = URI.parse(url)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)
pss = JSON.parse(response.body)
puts (pss)
