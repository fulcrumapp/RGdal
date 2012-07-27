module RGdal
  module API
    module ClassMethods
      def driver(name)
        define_method :driver_name do
          name
        end
      end

      def single_layer?(bool)
        define_method(:single_layer?) { bool }
      end

      def reference(name)
        define_method :reference do
          name
        end
      end

      def format(name)
        define_method :format do
          name
        end
      end
    end

    def self.included(receiver)
      receiver.extend(ClassMethods)
    end
  end
end
