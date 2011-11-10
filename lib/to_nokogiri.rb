# Copyright 2009 Sidu Ponnappa
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.

require 'logger'
require 'active_support'
require 'active_record'
require 'nokogiri'

module ToNokogiri  #:nodoc:
  def self.logger=(logger)
    @logger = logger
  end

  def self.logger
    @logger
  end
end

require "to_nokogiri/hash_extensions"
require "to_nokogiri/array_extensions"
require "to_nokogiri/active_record_extensions"
require "to_nokogiri/nokogiri_extensions"

Nokogiri::XML::Builder.send :include, ToNokogiri::NokogiriExtensions::XmlExtensions::BuilderExtensions
ActiveRecord::XmlSerializer.send(:include, ToNokogiri::ActiveRecordExtensions::XmlSerializerExtensions)
