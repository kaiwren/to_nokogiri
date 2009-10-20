require File.expand_path(File.dirname(__FILE__) + "/../lib/to_nokogiri")
require 'spec'


ToNokogiri.logger = Logger.new(File.open("#{ToNokogiri::Root}/../log/test.log", 'a'))
