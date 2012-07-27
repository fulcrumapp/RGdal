require 'spec_helper'

describe Gdal::Ogr::Feature do
  before(:each) do
    @path = File.join(Dir.pwd, "tmp/#{SecureRandom.hex(16)}.csv")
    @csv = RGdal::CSV.new(@path)
    @csv.new_layer('test')
    @fixture  = YAML.load(File.read('spec/fixtures/record.yml'))['example_one']
  end

  it 'should create a hash of the feature' do
    @csv.new_layer('test')
    @fixture.keys.each { |k| @csv.layer_field_definition(k) }
    @csv.feature('0.0', '0.0', @fixture)

    attributes = @csv.current_layer.get_next_feature.attributes
    attributes.class.should eq(Hash)
    attributes['city'].should == 'Washington'
  end
end
