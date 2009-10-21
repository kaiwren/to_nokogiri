module ToNokogiri
  module NokogiriExtensions
    module XmlExtensions
      module BuilderExtensions
        def tag!(sym, *args, &block)
          method_missing(sym.to_sym, *args, &block)
        end

        def to_s
          to_xml
        end
      end
    end
  end
end
