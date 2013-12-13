# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "iso_countries_plus/version"

Gem::Specification.new do |s|
  s.name        = "iso_countries_plus"
  s.version     = IsoCountriesPlus::VERSION
  s.platform    = Gem::Platform::RUBY
  spec.authors       = ["Mark Dickson"]
  spec.email         = ["mark@sitesteaders.com"]
  spec.description   = %q{This gem differs from other ISO country gems in that it allows VERY flexible name lookups, so country names like 'South Korea' will work properly.}
  spec.summary       = %q{ISO Countries, including all standard name variations, alpha2, and alpha3}
  s.homepage    = "https://github.com/ideaoforder/iso_countries_plus"

  s.rubyforge_project = "iso_countries_plus"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
