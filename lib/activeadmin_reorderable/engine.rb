require 'rails/engine'

module ActiveadminReorderable
  class Engine < Rails::Engine
    initializer "activeadmin_reorderable.importmap", before: "importmap" do |app|
      # Skip if importmap-rails is not installed
      next unless app.config.respond_to?(:importmap)

      app.config.importmap.paths << Engine.root.join("config/importmap.rb")
      app.config.importmap.cache_sweepers << Engine.root.join("app/assets/javascripts")
    end
  end
end
