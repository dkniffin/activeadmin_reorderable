$:.push File.expand_path("../lib", __FILE__)

require "activeadmin_reorderable/version"

Gem::Specification.new do |s|
  s.name        = "activeadmin_reorderable"
  s.version     = ActiveadminReorderable::VERSION
  s.authors     = ["Derek Kniffin", "Chris Jones", "Lawson Kurtz"]
  s.email       = ["derek.kniffin@gmail.com"]
  s.homepage    = "http://www.github.com/dkniffin/activeadmin_reorderable"
  s.summary     = "Drag and drop reordering for ActiveAdmin tables"
  s.description = "Add drag and drop reordering to ActiveAdmin tables."
  s.license     = "MIT"

  s.files = Dir["{app,lib}/**/*", "MIT-LICENSE", "package.json", "README.md"]

  s.add_development_dependency "activeadmin", "~> 3.0"
  s.add_development_dependency "acts_as_list"
  s.add_development_dependency "capybara"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "pry"
  s.add_development_dependency "puma"
  s.add_development_dependency "rails", "~> 6.1", ">= 6.1.4.4"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "selenium-webdriver", '~> 4.10'
  s.add_development_dependency "sqlite3", "~> 1.4"
  s.add_development_dependency "sassc-rails"
end
