module RGdal
  class CSV < RGdal::Base
    driver 'CSV'
    format Gdal::Ogr::WKBUNKNOWN
  end
end
