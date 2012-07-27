module RGdal
  class Base
    include API

    attr_reader :data_source
    attr_reader :current_layer
    attr_reader :driver

    reference nil
    single_layer? false
    format Gdal::Ogr::WKBUNKNOWN

    def initialize(source)
      @source = source
      @data_source = driver.create_data_source(@source)
      @current_layer = layers.first
      @columns = @current_layer ? @current_layer.fields.map(&:name) : []
    end

    def layers
      @layers = @data_source.layers
    end

    def driver
      @driver ||= Gdal::Ogr.get_driver_by_name(driver_name)
    end

    def switch_layer(name)
      @current_layer = @layers.select { |layer| layer.name == name }.first
      @columns = @current_layer ? @current_layer.fields.map(&:name) : []
    end

    def new_layer(filename='export')
      layer(filename).tap do |layer|
        @current_layer = layer
        @layers << layer
        @columns = []
      end
    end

    def layer(filename)
      @data_source.create_layer(filename, reference, format)
    end

    def close
      @driver = nil
      @data_source = nil
      @current_layer = nil
      @columns = nil
    end

    def layer_field_definition(name, options={})
      options, name = {type: Gdal::Ogr::OFTSTRING, width: 254}.merge(options), header(name)
      @columns.push(name)
      field_definition = create_field_definition(name, options)
      @current_layer.create_field(field_definition)
      field_definition = nil
    end

    def create_field_definition(name, options)
      Gdal::Ogr::FieldDefn.new(name, options[:type]).tap do |field|
        field.set_width(options[:width]) if options[:width]
        field.set_precision(options[:precision]) if options[:precision]
      end
    end

    def feature(longitude, latitude, attributes={})
      feat = Gdal::Ogr::Feature.new(@current_layer.definition)
      set_geometry(latitude, longitude, feat)
      set_attributes(attributes, feat)

      @current_layer.create_feature(feat)
      @current_layer.reset_reading
    end

private

    def header(key)
      key
    end

    def value(attrib)
      attrib
    end

    def set_attributes(attributes, feat)
      attributes.each do |key, value|
        key = header(key)
        feat.set_field(key, value(value)) if value.is_a?(String) && @columns.include?(key)
      end
    end

    def set_geometry(latitude, longitude, feat)
      coordinates = "POINT(#{longitude} #{latitude})"
      geometry = Gdal::Ogr::create_geometry_from_wkt(coordinates)
      feat.set_geometry(geometry)
      geometry = nil
    end
  end
end
