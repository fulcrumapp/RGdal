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

  it 'should create a valid CSV file' do
    @fixture.keys.each { |key| @csv.layer_field_definition(key) }
    @csv.feature(0.0, 0.0, @fixture)
    @csv.close()

    csv = CSV.open(@path, headers: true).first.to_hash
    csv['city'].should == 'Washington'
  end
end
