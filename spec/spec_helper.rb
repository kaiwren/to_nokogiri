require "to_nokogiri"

ToNokogiri.logger = Logger.new(File.open(File.join("#{File.expand_path(File.dirname(__FILE__))}", "..", "log", "test.log"), 'a'))

ActiveRecord::Base.establish_connection(YAML.load_file("spec/database.yml")["test"])
load("spec/schema.rb")

class Bottle < ActiveRecord::Base
end