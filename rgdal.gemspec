# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rgdal/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Spatial Networks"]
  gem.email         = ["sniadmin@spatialnetworks.com"]
  gem.description   = %q{Pretty wrapper for GDAL/OGR}
  gem.summary       = %q{Pretty wrapper for GDAL/OGR}
  gem.homepage      = "https://github.com/spatialnetworks/RGdal"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rgdal"
  gem.require_paths = ["lib"]
  gem.version       = Rgdal::VERSION

  gem.add_dependency('gdal', '~> 0.0.5')
  gem.add_dependency('activesupport')
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('rake')
end
