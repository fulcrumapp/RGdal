module Gdal
  module Ogr
    class FieldDefn
      def to_s
        "#<Gdal::Ogr::FieldDefn name='#{name}' type='#{type}' width='#{width}' precision='#{precision}' is_ignored='#{is_ignored}'>"
      end
      
      alias_method :name, :get_name
      alias_method :type, :get_type_name
      alias_method :width, :get_width
      alias_method :precision, :get_precision
    end
  end
end
