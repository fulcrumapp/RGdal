require 'spec_helper'

describe RGdal::SHP do
  before(:each) do
    @fixture  = YAML.load(File.read('spec/fixtures/record.yml'))['example_one']
    @path     = File.join(Dir.pwd, 'tmp', "#{SecureRandom.hex(16)}")
    Dir.mkdir(@path)
    @shp      = RGdal::SHP.new(@path)
    @shp.new_layer('test')
  end

  it 'should create a shapefile' do
    @fixture.keys.each { |key| @shp.add_column(key) }
    @shp.feature(0.0, 0.0, @fixture)
    @shp.close()

    File.size(File.join(@path, 'test.dbf')).should_not == 0
  end
end
