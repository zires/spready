$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spready/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spready"
  s.version     = Spready::VERSION
  s.authors     = ["zires"]
  s.email       = ["zshuaibin@gmail.com"]
  s.homepage    = "https://github.com/zires/spready"
  s.summary     = "A better way to forum"
  s.description = "TODO: Description of Spready."

  s.files = Dir["{app,config,db,lib,orm}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
