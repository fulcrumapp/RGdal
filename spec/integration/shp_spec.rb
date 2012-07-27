require 'spec_helper'

describe RGdal::SHP do
  @fixture  = YAML.load(File.read('spec/fixtures/record.yml'))['example_one']
  @path     = File.join(Dir.pwd, 'tmp', "#{SecureRandom.hex(16)}")
  @csv      = RGdal::CSV.new(@path)
  @csv.new_layer('test')
end
