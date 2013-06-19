require "twitter"

Twitter.configure do |config|
  config.consumer_key = "f7Kkx1x1M1TcvBmgLALl1g"
  config.consumer_secret = "A7Ixe8QC4OdozQeK33SukptijllyMACuwWyW74j4"
  config.oauth_token = "14859518-xMT4AWraObBx4tbc7llsR47gQI0UO9oMymEaTBGO5"
  config.oauth_token_secret = "0dWJipCTBpaKPz1SH2ozTe6hFVz3eti7xuxs3Nw2ck"
end

# result = Twitter.search("hi")


Twitter.search("hi", :count => 3, :result_type => "recent").results.map do |status|
  puts "#{status.from_user}: #{status.text}"
end


puts Twitter.search("hi", :count => 3, :result_type => "recent").results.inspect