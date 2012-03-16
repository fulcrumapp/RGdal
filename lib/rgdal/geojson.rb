module RGdal
  class GeoJSON < RGdal::Base
    driver 'GeoJSON'
    format Gdal::Ogr::WKBUNKNOWN
  end
end
