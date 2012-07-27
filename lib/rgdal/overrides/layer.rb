module Gdal
  module Ogr
    class Layer

      alias_method :definition, :get_layer_defn

      def features
        [].tap do |array|
          self.each { |feature| array << feature }
          reset_reading
        end
      end

      def to_s
        "#<Gdal::Ogr::Layer name='#{self.get_name}' field_count='#{fields.count}'>"
      end

      def fields
        definition.get_field_count.times.map { |i| definition.get_field_defn(i) }
      end

      def column_names
        fields.map(&:name)
      end

      def fields_hash
        {}.tap do |hash|
          fields.each do |field|
            hash[field.name] = field.type
          end
        end
      end
    end
  end
end
