module ToNokogiri
  module ArrayExtensions
    def to_xml(options = {})
      raise "Not all elements respond to to_xml" unless all? { |e| e.respond_to? :to_xml }

      options = options.dup
      options[:encoding] ||= 'UTF-8'      
      options[:root]     ||= all? { |e| e.is_a?(first.class) && first.class.to_s != "Hash" } ? first.class.to_s.underscore.pluralize : "records"
      options[:children] ||= options[:root].singularize
      # options[:indent]   ||= 2
      options[:builder]  ||= Nokogiri::XML::Builder.new(:encoding => options[:encoding])

      root     = options.delete(:root).to_s
      children = options.delete(:children)

      if !options.has_key?(:dasherize) || options[:dasherize]
        root = root.dasherize
      end

      # options[:builder].instruct! unless options.delete(:skip_instruct)

      opts = options.merge({ :root => children })

      xml = options[:builder]
      if empty?
        xml.send(root, options[:skip_types] ? {} : {:type => "array"})
      else
        array = self
        xml.send(root, options[:skip_types] ? {} : {:type => "array"}) {
          yield xml if block_given?
          # each { |e| e.to_xml(opts.merge({ :skip_instruct => true })) }
          array.each { |e| e.to_xml(opts) }
        }
      end
    end
  end
end