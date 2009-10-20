module ToNokogiri
  module HashExtensions
    def to_xml(options = {})
      options[:indent] ||= 2
      options.reverse_merge!({ :builder => Nokogiri::XML::Builder,
      :root => "hash" })
      # options[:builder].instruct! unless options.delete(:skip_instruct)
      root = rename_key(options[:root].to_s, options)
      # options[:builder].__send__(:method_missing, root) do
      builder = options[:builder].new do |xml|
        xml.root do
          each do |key, value|
            case value
            when ::Hash
              value.to_xml(options.merge({ :root => key, :skip_instruct => true }))
            when ::Array
              value.to_xml(options.merge({ :root => key, :children => key.to_s.singularize, :skip_instruct => true}))
            when ::Method, ::Proc
              # If the Method or Proc takes two arguments, then
              # pass the suggested child element name.  This is
              # used if the Method or Proc will be operating over
              # multiple records and needs to create an containing
              # element that will contain the objects being
              # serialized.
              if 1 == value.arity
                value.call(options.merge({ :root => key, :skip_instruct => true }))
              else
                value.call(options.merge({ :root => key, :skip_instruct => true }), key.to_s.singularize)
              end
            else
              if value.respond_to?(:to_xml)
                value.to_xml(options.merge({ :root => key, :skip_instruct => true }))
              else
                type_name = ActiveSupport::CoreExtensions::Hash::Conversions::XML_TYPE_NAMES[value.class.name]

                key = rename_key(key.to_s, options)

                attributes = options[:skip_types] || value.nil? || type_name.nil? ? { } : { :type => type_name }
                if value.nil?
                  attributes[:nil] = true
                end

                xml.send("#{key}_",
                ActiveSupport::CoreExtensions::Hash::Conversions::XML_FORMATTING[type_name] ? ActiveSupport::CoreExtensions::Hash::Conversions::XML_FORMATTING[type_name].call(value) : value,
                attributes
                )
              end
            end
          end
        end

        yield options[:builder] if block_given?
      end
      builder.to_xml
    end
  end
end