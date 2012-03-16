module RGdal
  class Base
    unloadable
    attr_reader :data_source
    attr_reader :current_layer

    def initialize(source)
      @data_source = driver.create_data_source(source)
      @current_layer = layers.first
      @columns = @current_layer ? @current_layer.fields.map(&:name) : []
    end
    
    def layers
      @layers = @data_source.layers
    end
    
    def driver
      Gdal::Ogr.get_driver_by_name(driver_name)
    end
    
    def switch_layer(name)
      @current_layer = @layers.select { |layer| layer.name == name }.first
    end
    
    def new_layer(filename='export')
      layer(filename).tap do |layer|
        @current_layer = layer
        @layers << layer
      end
    end
    
    def layer(filename)
      @data_source.create_layer(filename, reference, format)
    end
    
    def header(key)
      key
    end
    
    def value(attrib)
      attrib
    end

    def layer_field_definition(name, options={})
      options = {'type' => Gdal::Ogr::OFTSTRING, 'width' => 254}.merge(options)
      name = header(name)
      field_definition = Gdal::Ogr::FieldDefn.new(name, options['type'])
      @columns.push name
      field_definition.set_width(options['width']) if options['width']
      field_definition.set_precision(options['precision']) if options['precision']
      @current_layer.create_field(field_definition)
    end

    def feature(longitude, latitude, opts={})
      feat = Gdal::Ogr::Feature.new(@current_layer.definition)
      
      # Geometry
      wkt = "POINT(#{longitude} #{latitude})"
      geometry = Gdal::Ogr::create_geometry_from_wkt(wkt)
      feat.set_geometry(geometry)

      # Metadata
      opts.each do |key, value|
        key = header(key)
        if value.is_a?(String)
          layer_field_definition(key) unless @columns.include?(key)
          feat.set_field(key, value(value))
        end
      end

      @current_layer.create_feature(feat)
      puts 'Added Layer'
      @current_layer.reset_reading
    end

    def close
      @data_source.layers.map(&:sync_to_disk)
      @data_source = nil
    end

    # Pretty API
    class << self
      def driver(name)
        define_method :driver_name do
          name
        end
      end
      
      def single_layer?(bool=false)
        define_method(:single_layer?) { bool }
      end

      def reference(name=nil)
        define_method :reference do
          name
        end
      end

      def format(name)
        define_method :format do
          name
        end
      end
    end
  end
end
