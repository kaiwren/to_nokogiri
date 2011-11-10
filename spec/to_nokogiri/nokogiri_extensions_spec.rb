require 'spec_helper'

describe 'Nokogiri Extensions' do
  it "should create tags with tag!" do
    builder = Nokogiri::XML::Builder.new
    builder.tag!('div')
    builder.to_xml.should == "<?xml version=\"1.0\"?>\n<div/>\n"
  end
end
