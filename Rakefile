# # require 'bundler'
# # Bundler::GemHelper.install_tasks

# require 'jeweler'
# Jeweler::Taskgemspec.new do |gemspec|
#   gemspec.name        = "iso_countries_plus"
#   gemspec.version     = "0.2.0"
#   gemspec.platform    = Gem::Platform::RUBY
#   gemspec.authors       = ["Mark Dickson"]
#   gemspec.email         = ["mark@sitesteadergemspec.com"]
#   gemspec.description   = %q{This gem differs from other ISO country gems in that it allows VERY flexible name lookups, so country names like 'South Korea' will work properly.}
#   gemspec.summary       = %q{ISO Countries, including all standard name variations, alpha2, and alpha3}
#   gemspec.homepage    = "https://github.com/ideaoforder/iso_countries_plus"

#   gemspec.rubyforge_project = "iso_countries_plus"

#   gemspec.files         = `git ls-files`.split("\n")
#   gemspec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
#   gemspec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
#   gemspec.require_paths = ["lib"]
# end

# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "iso_countries_plus"
  gem.version = "0.2.0"
  gem.homepage = "http://github.com/ideaoforder/iso_countries_plus"
  gem.license = "MIT"
  gem.description = %q{This gem differs from other ISO country gems in that it allows VERY flexible name lookups, so country names like 'South Korea' will work properly.}
  gem.summary = %q{ISO Countries, including all standard name variations, alpha2, and alpha3}
  gem.email = "mark@sitesteaders.com"
  gem.authors = ["Mark Dickson"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['test'].execute
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "iso_countries_plus #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
