require 'spec_helper'

describe RGdal::GeoJSON do
  before(:each) do
    @fixture  = YAML.load(File.read('spec/fixtures/record.yml'))['example_one']
    @path     = File.join(Dir.pwd, 'tmp', "#{SecureRandom.hex(16)}.json")
    @geojson  = RGdal::GeoJSON.new(@path)
    @geojson.new_layer('test')
  end

  it 'should create a valid CSV file' do
    @fixture.keys.each { |key| @geojson.add_column(key) }
    @geojson.feature(0.0, 0.0, @fixture)
    @geojson.close()
    GC.start && sleep(5) # Sigh

    geojson = JSON.parse(File.read(@path))
    geojson['features'].length.should == 1
  end
end
