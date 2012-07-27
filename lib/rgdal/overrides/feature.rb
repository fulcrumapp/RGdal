module Gdal
  module Ogr
    class Feature
      def inspect
        "#<Gdal::Ogr::Feature #{attributes.map { |k,v| "'#{k}'='#{v}'"}.join(' ')}>"
      end

      def attributes
        {}.tap do |hash|
          get_field_count.times do |i|
            definition = self.get_field_defn_ref(i)
            hash[definition.name] = get_field(i)
          end
        end
      end
    end
  end
end
