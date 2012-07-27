require 'spec_helper'

describe Gdal::Ogr::DataSource do
  before(:each) do
    @path = "tmp/#{SecureRandom.hex(16)}.csv"
    @csv = RGdal::CSV.new(@path)
    @csv.new_layer('test')
  end

  it 'should return an array of layer objects' do
    @csv.data_source.layers.length.should == 1
    @csv.new_layer('foobar')
    @csv.data_source.layers.length.should == 2
  end

  it 'should have a driver name' do
    @csv.driver_name.should == 'CSV'
  end
end
