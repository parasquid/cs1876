$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mv-standard-app-theme/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mv-standard-app-theme"
  s.version     = MvStandardAppTheme::VERSION
  s.authors     = ["Tristan Gomez"]
  s.email       = ["tristan@mindvalley.com"]
  s.homepage    = "www.mindvaley.com"
  s.summary     = "Mindvalley Standard Application Theme"
  s.description = "Mindvalley Standard Application Theme"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "jquery-rails"
  s.add_dependency 'bootstrap-sass'

end
