module RGdal
  module FlatFormat
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def driver(name)
        @driver = name
      end

      def reference(name=nil)
        @reference = name
      end

      def format(name)
        @format = name
      end
    end
  end
end
