module Gdal
  module Ogr
    class Feature
      def inspect
        "#<Gdal::Ogr::Feature #{attributes.map { |k,v| "'#{k}'='#{v}'"}.join(' ')}>"
      end

      def attributes
        {}.tap do |hash|
          get_field_count.times do |i|
            defn = get_field_defn_ref(i)
            name = defn.name
            value = get_field(i)

            hash[name] = value

            defn = nil
            name = nil
            value = nil
          end
        end
      end
    end
  end
end
