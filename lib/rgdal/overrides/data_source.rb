module Gdal
  module Ogr
    class DataSource
      def to_s
        "<#Gdal::Ogr::DataSource name='#{get_name}' layer_count='#{get_layer_count}' driver='#{driver_name}'>"
      end

      def layers
        get_layer_count.times.map { |i| get_layer(i) }
      end

      def driver_name
        get_driver.get_name
      end
    end
  end
end
