module RGdal
  class SHP < RGdal::Base
    driver 'ESRI Shapefile'
    format Gdal::Ogr::WKBPOINT
    reference Gdal::Osr::SpatialReference.new.tap { |srs| srs.import_from_proj4("+proj=longlat +ellps=WGS84 +datum=WGS84") }

    FILE_EXTENSIONS = ['.shp', '.dbf', '.prj', '.shx']

    def header(key)
      key[0..9]
    end

    def value(attrib)
      attrib[0..253]
    end
  end
end
