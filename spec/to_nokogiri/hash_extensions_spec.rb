require 'spec_helper'

describe ToNokogiri::HashExtensions do  
  def serialised_collection
      <<-EOXML
<?xml version="1.0" encoding="UTF-8"?>
    <business-units type="array">
      <business-unit>
        <company>OogaInc</company>
        <created-at type="datetime">2008-08-27T16:21:33Z</created-at>
        <department>FooMeh</department>
        <id type="integer">1</id>
        <client-number>0001</client-number>
        <updated-at type="datetime">2008-08-27T16:21:33Z</updated-at>
        <accounts type="array">
          <account>
            <account-number>1</account-number>
            <created-at type="datetime">2008-08-27T16:21:33Z</created-at>
            <id type="integer">1</id>
            <client-id type="integer">1</client-id>
            <updated-at type="datetime">2008-08-27T16:21:33Z</updated-at>
            <client-number>0001</client-number>
          </account>
        </accounts>
      </business-unit>
      <business-unit>
        <company>OogaInc</company>
        <created-at type="datetime">2008-08-27T18:35:22Z</created-at>
        <department>BoogaBooga</department>
        <id type="integer">32479</id>
        <client-number>0002</client-number>
        <updated-at type="datetime">2008-08-27T18:35:37Z</updated-at>
        <accounts type="array">
          <account>
            <account-number>0</account-number>
            <created-at type="datetime">2008-08-27T18:36:07Z</created-at>
            <id type="integer">32479</id>
            <client-id type="integer">32479</client-id>
            <updated-at type="datetime">2008-08-27T18:36:12Z</updated-at>
            <client-number>0002</client-number>
          </account>
        </accounts>
      </business-unit>
      <business-unit>
        <company>OogaInc</company>
        <created-at type="datetime">2008-08-27T16:21:33Z</created-at>
        <department>Engineering</department>
        <id type="integer">2</id>
        <client-number>000101</client-number>
        <updated-at type="datetime">2008-08-27T16:21:33Z</updated-at>
        <accounts type="array">
          <account>
            <account-number>101</account-number>
            <created-at type="datetime">2008-08-27T16:21:33Z</created-at>
            <id type="integer">2</id>
            <client-id type="integer">2</client-id>
            <updated-at type="datetime">2008-08-27T16:21:33Z</updated-at>
            <client-number>000101</client-number>
          </account>
        </accounts>
      </business-unit>
      <business-unit>
        <company>OogaInc</company>
        <created-at type="datetime">2008-08-27T16:21:34Z</created-at>
        <department></department>
        <id type="integer">3</id>
        <client-number>0001000</client-number>
        <updated-at type="datetime">2008-08-27T16:21:34Z</updated-at>
        <accounts type="array">
          <account>
            <account-number>31974</account-number>
            <created-at type="datetime">2008-08-27T16:21:34Z</created-at>
            <id type="integer">3</id>
            <client-id type="integer">3</client-id>
            <updated-at type="datetime">2008-08-27T16:21:34Z</updated-at>
            <client-number>0001000</client-number>
          </account>
        </accounts>
      </business-unit>
      <business-unit>
        <company>OogaInc</company>
        <created-at type="datetime">2008-08-27T16:21:34Z</created-at>
        <department></department>
        <id type="integer">4</id>
        <client-number>0001001</client-number>
        <updated-at type="datetime">2008-08-27T16:21:34Z</updated-at>
        <accounts type="array">
          <account>
            <account-number>656064</account-number>
            <created-at type="datetime">2008-08-27T16:21:34Z</created-at>
            <id type="integer">4</id>
            <client-id type="integer">4</client-id>
            <updated-at type="datetime">2008-08-27T16:21:34Z</updated-at>
            <client-number>0001001</client-number>
          </account>
        </accounts>
      </business-unit>
      <business-unit>
        <company>OogaInc</company>
        <created-at type="datetime">2008-08-27T16:21:34Z</created-at>
        <department></department>
        <id type="integer">5</id>
        <client-number>0001002</client-number>
        <updated-at type="datetime">2008-08-27T16:21:34Z</updated-at>
        <accounts type="array">
          <account>
            <account-number>619842</account-number>
            <created-at type="datetime">2008-08-27T16:21:34Z</created-at>
            <id type="integer">5</id>
            <client-id type="integer">5</client-id>
            <updated-at type="datetime">2008-08-27T16:21:34Z</updated-at>
            <client-number>0001002</client-number>
          </account>
        </accounts>
      </business-unit>
      <business-unit>
        <company>OogaInc</company>
        <created-at type="datetime">2008-08-27T16:21:34Z</created-at>
        <department></department>
        <id type="integer">6</id>
        <client-number>0001003</client-number>
        <updated-at type="datetime">2008-08-27T16:21:34Z</updated-at>
        <accounts type="array">
          <account>
            <account-number>694370</account-number>
            <created-at type="datetime">2008-08-27T16:21:34Z</created-at>
            <id type="integer">6</id>
            <client-id type="integer">6</client-id>
            <updated-at type="datetime">2008-08-27T16:21:34Z</updated-at>
            <client-number>0001003</client-number>
          </account>
        </accounts>
      </business-unit>
      <business-unit>
        <company>OogaInc</company>
        <created-at type="datetime">2008-08-27T16:21:34Z</created-at>
        <department></department>
        <id type="integer">7</id>
        <client-number>0001004</client-number>
        <updated-at type="datetime">2008-08-27T16:21:34Z</updated-at>
        <accounts type="array">
          <account>
            <account-number>29284</account-number>
            <created-at type="datetime">2008-08-27T16:21:34Z</created-at>
            <id type="integer">7</id>
            <client-id type="integer">7</client-id>
            <updated-at type="datetime">2008-08-27T16:21:34Z</updated-at>
            <client-number>0001004</client-number>
          </account>
        </accounts>
      </business-unit>
      <business-unit>
        <company>OogaInc</company>
        <created-at type="datetime">2008-08-27T16:21:34Z</created-at>
        <department></department>
        <id type="integer">8</id>
        <client-number>0001005</client-number>
        <updated-at type="datetime">2008-08-27T16:21:34Z</updated-at>
        <accounts type="array">
          <account>
            <account-number>21285</account-number>
            <created-at type="datetime">2008-08-27T16:21:34Z</created-at>
            <id type="integer">8</id>
            <client-id type="integer">8</client-id>
            <updated-at type="datetime">2008-08-27T16:21:34Z</updated-at>
            <client-number>0001005</client-number>
          </account>
        </accounts>
      </business-unit>
      <business-unit>
        <company>OogaInc</company>
        <created-at type="datetime">2008-08-27T16:21:34Z</created-at>
        <department></department>
        <id type="integer">9</id>
        <client-number>0001006</client-number>
        <updated-at type="datetime">2008-08-27T16:21:34Z</updated-at>
        <accounts type="array">
          <account>
            <account-number>638772</account-number>
            <created-at type="datetime">2008-08-27T16:21:34Z</created-at>
            <id type="integer">9</id>
            <client-id type="integer">9</client-id>
            <updated-at type="datetime">2008-08-27T16:21:34Z</updated-at>
            <client-number>0001006</client-number>
          </account>
        </accounts>
      </business-unit>
    </business-units>
    EOXML
  end

  def serialised_nested_entity
  <<-EOXML
<?xml version="1.0" encoding="UTF-8"?>
<business-unit>
  <company>OogaInc</company>
  <created-at type="datetime">2008-08-27T16:21:33Z</created-at>
  <department>FooMeh</department>
  <id type="integer">1</id>
  <client-number>0001</client-number>
  <updated-at type="datetime">2008-08-27T16:21:33Z</updated-at>
  <accounts type="array">
    <account>
      <account-number>1</account-number>
      <created-at type="datetime">2008-08-27T16:21:33Z</created-at>
      <id type="integer">1</id>
      <client-id type="integer">1</client-id>
      <updated-at type="datetime">2008-08-27T16:21:33Z</updated-at>
      <client-number>0001</client-number>
    </account>
  </accounts>
</business-unit>
EOXML
  end

  def serialised_entity
    <<-EOXML
<?xml version="1.0" encoding="UTF-8"?>
<business-unit>
  <company>OogaInc</company>
  <created-at type="datetime">2008-08-27T16:21:33Z</created-at>
  <department>FooMeh</department>
  <id type="integer">1</id>
  <client-number>0001</client-number>
  <updated-at type="datetime">2008-08-27T16:21:33Z</updated-at>
</business-unit>
EOXML
  end

  before :all do
    ActiveSupport::XmlMini.backend.should == ActiveSupport::XmlMini_REXML
    @standard_deserialised_hash = Hash.from_xml serialised_entity
    @standard_serialised_hash = @standard_deserialised_hash.to_xml
    
    @nested_deserialised_hash = Hash.from_xml serialised_nested_entity
    @nested_serialised_hash = @nested_deserialised_hash.to_xml
    
    @complex_deserialised_hash = Hash.from_xml serialised_collection
    @complex_serialised_hash = @complex_deserialised_hash.to_xml
    
    Hash.send(:include, ToNokogiri::HashExtensions)
    Array.send(:include, ToNokogiri::ArrayExtensions)
  end
  
  it "should serialise simple xml the same as Builder::XmlMarkup" do
    @standard_deserialised_hash.to_xml(:dasherize => true).should == @standard_serialised_hash
  end
  
  it "should serialise xml with a nested array the same as Builder::XmlMarkup" do
    @nested_deserialised_hash.to_xml(:dasherize => true).should == @nested_serialised_hash
  end
  
  it "should serialise complex xml with a collections and nested arrays and hashes the same as Builder::XmlMarkup" do
    @complex_deserialised_hash.to_xml(:dasherize => true).should == @complex_serialised_hash
  end
end
