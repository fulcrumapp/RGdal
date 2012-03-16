module RGdal
  class KML < RGdal::Base
    driver 'KML'
    format Gdal::Ogr::WKBUNKNOWN
  end
end
