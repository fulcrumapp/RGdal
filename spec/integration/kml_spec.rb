require 'spec_helper'

describe RGdal::KML do
  before(:each) do
    @fixture  = YAML.load(File.read('spec/fixtures/record.yml'))['example_one']
    @path     = File.join(Dir.pwd, 'tmp', "#{SecureRandom.hex(16)}")
    @kml      = RGdal::KML.new(@path)
    @kml.new_layer('test')
  end

  it 'should create a KML file' do
    @fixture.keys.each { |key| @kml.add_column(key) }
    @kml.feature(0.0, 0.0, @fixture)
    @kml.close()
    GC.start && sleep(5) # Sigh

    File.open(@path).readline.should == "<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n"
  end
end
