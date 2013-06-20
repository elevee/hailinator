require "twitter"
require "csv"
require 'fileutils'

Twitter.configure do |config| # AUTHENTICATION
  config.consumer_key = "f7Kkx1x1M1TcvBmgLALl1g"
  config.consumer_secret = "A7Ixe8QC4OdozQeK33SukptijllyMACuwWyW74j4"
  config.oauth_token = "14859518-xMT4AWraObBx4tbc7llsR47gQI0UO9oMymEaTBGO5"
  config.oauth_token_secret = "0dWJipCTBpaKPz1SH2ozTe6hFVz3eti7xuxs3Nw2ck"
end

puts Twitter.search("hi", :count => 3, :result_type => "recent").results.inspect # TWITTER::TWEETS Class

FileUtils.touch('file.csv')

results = Twitter.search("hi", :count => 3, :result_type => "recent").results


CSV.open("file.csv", "wb") do |csv| # OPEN CSV
	csv << ["handle", "text", "url"] # CREATE HEADERS
	results.each do | status |
		puts "#{status.from_user}: #{status.text}: http://www.twitter.com/#{status.from_user}/status/#{status.id}" #get inside each tweet object and get handle, text, url
		csv << ["#{status.from_user}", "#{status.text}, http://www.twitter.com/#{status.from_user}/status/#{status.id}"]
	end
end
