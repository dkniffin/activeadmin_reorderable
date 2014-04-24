require 'activeadmin'

Dir[File.dirname(__FILE__) + '/activeadmin_reorderable/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/active_admin/**/*.rb'].each {|file| require file }

::ActiveAdmin::ResourceDSL.send(:include, ActiveAdmin::Reorderable::DSL)
