module Gdal
  module Ogr
    class DataSource
      def to_s
        "<#Gdal::Ogr::DataSource name='#{get_name}' layer_count='#{get_layer_count}' driver='#{get_driver.get_name}'>"
      end
      
      def layers
        get_layer_count.times.map { |i| get_layer(i) }
      end
    end
  end
end
