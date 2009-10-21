require 'active_record/serializers/xml_serializer'

module ToNokogiri
  module ActiveRecordExtensions
    module XmlSerializerExtensions
      def self.included(klass)
        klass.class_eval do
          def builder
            @builder ||= begin
              options[:encoding] ||= 'UTF-8'
              builder = options[:builder] ||= Nokogiri::XML::Builder.new(:encoding => options[:encoding])

              # unless options[:skip_instruct]
              #   builder.instruct!
              #   options[:skip_instruct] = true
              # end
              builder
            end
          end
          
          def serialize
            args = [root]
            if options[:namespace]
              args << {:xmlns=>options[:namespace]}
            end

            if options[:type]
              args << {:type=>options[:type]}
            end

            this = self
            builder.tag!(*args) do
              this.add_attributes
              procs = this.options.delete(:procs)
              this.add_includes { |association, records, opts| this.add_associations(association, records, opts) }
              this.options[:procs] = procs
              this.add_procs
              yield builder if block_given?
            end
            builder.to_xml
          end
        end
      end
    end
  end
end