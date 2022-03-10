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

  s.files = `git ls-files`.split($/)

  s.add_development_dependency "activeadmin", ">= 0.6"
end
