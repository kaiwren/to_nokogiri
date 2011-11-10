require 'spec_helper'

describe 'ActiveRecord XML serialization' do
  
  it "should serialize all its attributes" do
    bottle = Bottle.new :name => 'beer', :capacity => 10
    bottle.to_xml.should == "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<bottle>\n  <capacity type=\"integer\">10</capacity>\n  <name>beer</name>\n</bottle>\n"
  end
end
