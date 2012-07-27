require 'spec_helper'

describe RGdal::CSV do

  before(:each) do
    @fixture  = YAML.load(File.read('spec/fixtures/record.yml'))['example_one']
    @path     = File.join(Dir.pwd, 'tmp', "#{SecureRandom.hex(16)}.csv")
    @csv      = RGdal::CSV.new(@path)
    @csv.new_layer('test')
  end

  it 'should create a layer' do
    @csv.current_layer.should_not == nil
  end

  it 'should create field definition on the layer' do
    @csv.layer_field_definition(@fixture.keys.first)
    @csv.current_layer.fields.size.should == 1
  end

  it 'should create an row in the csv' do
    @fixture.keys.each { |k| @csv.layer_field_definition(k) }
    @csv.feature('0.0', '0.0', @fixture)
    value = @csv.current_layer
    @csv.current_layer.reset_reading
  end
end
