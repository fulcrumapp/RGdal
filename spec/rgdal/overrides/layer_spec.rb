require 'spec_helper'

describe Gdal::Ogr::Layer do
  before(:each) do
    @fixture  = YAML.load(File.read('spec/fixtures/record.yml'))['example_one']
    @path     = File.join(Dir.pwd, 'tmp', "#{SecureRandom.hex(16)}.csv")
    @csv      = RGdal::CSV.new(@path)
    @csv.new_layer('test')
    @fixture.keys.each { |k| @csv.layer_field_definition(k) }
  end

  it 'should return an array of column names' do
    @csv.current_layer.column_names.should == %w(latitude longitude city state misc)
  end

  it 'should return an array of features' do
    @csv.feature('0.0', '0.0', @fixture)
    @csv.current_layer.features.length.should == 1
  end

  it 'should return a field hash with types' do
    hash = @csv.current_layer.fields_hash
    hash.class.should  == Hash
    hash.keys.should   == %w(latitude longitude city state misc)
    hash.values.should == %w(String) * 5
  end
end
