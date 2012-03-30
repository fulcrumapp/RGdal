# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rgdal/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tyler Johnston"]
  gem.email         = ["tylerjohnst@gmail.com"]
  gem.description   = %q{Pretty wrapper for GDal/OGR}
  gem.summary       = %q{Pretty wrapper for GDal/OGR}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rgdal"
  gem.require_paths = ["lib"]
  gem.version       = Rgdal::VERSION
end
