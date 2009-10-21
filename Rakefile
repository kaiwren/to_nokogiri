require 'rubygems'
gem 'rspec'
require 'rake'
require 'spec'
require 'spec/rake/spectask'

desc 'Default: run spec tests.'
task :default => :spec

desc "Run all specs"
Spec::Rake::SpecTask.new(:spec) do |task|
  task.spec_files = FileList['spec/to_nokogiri/**/*_spec.rb']
  task.spec_opts = ['--options', 'spec/spec.opts']
end

desc 'Benchmark xml (de)serialisation using a backend specified by BACKEND' 
task :benchmark do
  def serialised_data
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

  require 'benchmark'
  require File.expand_path(File.dirname(__FILE__) + "/lib/to_nokogiri")
  
  ActiveSupport::XmlMini.backend = 'REXML'
  deserialised_data = Hash.from_xml serialised_data
  
  Benchmark.bmbm(10) do |rpt|
    rpt.report("Serialisation using Builder::XmlMarkup for Hash#to_xml") do
      100.times { deserialised_data.to_xml }
    end
  end
  
  builder_xml = deserialised_data.to_xml
  
  Hash.send(:include, ToNokogiri::HashExtensions)
  Array.send(:include, ToNokogiri::ArrayExtensions)
  
  nokogiri_xml = deserialised_data.to_xml
  
  Benchmark.bmbm(10) do |rpt|
    rpt.report("Serialisation using Nokogiri::XML::Builder for Hash#to_xml") do
      100.times { deserialised_data.to_xml }
    end
  end
  
  builder_xml == nokogiri_xml ? puts("Success! Builder and Nokogiri have the same output") : puts("Fail! Builder and Nokogiri have different output")
end