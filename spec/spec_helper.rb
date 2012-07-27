require 'rspec'
require 'rgdal'
require 'csv'
require 'tempfile'
require 'json'
require 'securerandom'
require 'yaml'

RSpec.configure do |config|
  config.after(:each) do
    temp_directory = File.join(Dir.pwd, 'tmp')
    FileUtils.rm_r(Dir["#{temp_directory}/[^.]*"])
  end
end
