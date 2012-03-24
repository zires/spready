# This is a benchmark for configuration solution between db and yml.
require File.expand_path('../../config/environment', __FILE__)
require 'benchmark'

class Settings < Settingslogic
  source "#{Rails.root}/config/setting.yml"
  namespace Rails.env
end

class Site
  include Singleton

  include Mongoid::Document

  field :subdomain,        :type => Boolean, :default => false      # Use subdomain or not.
  field :specifical_index, :type => Boolean, :default => false      # Use specifical index page or not. If it's true, '/' will redirect to 'welcome#index'.
  field :forum,            :type => String                          # Default forum. If it's nil, will be the first forum
  field :theme,            :type => String,  :default => 'spready'  # Default theme
  
  # Use method missing to do like Site.subdomain.
  def self.method_missing(method, *args, &block)
    if instance.respond_to?(method)
      instance.send method.to_sym
    else
      super
    end
  end

end

f = Forum.new

Benchmark.bm do |b|
  
  b.report('db') do 
    50000.times{ Site.theme }
  end

  b.report('yml') do 
    50000.times{ Settings.subdomain }
  end

  b.report('db_cache') do 
    50000.times{ f.theme }
  end

end

# user        system      total        real
# db        0.510000   0.000000   0.510000 (  0.510886)
# yml       0.040000   0.000000   0.040000 (  0.036257)
# db_cache  0.100000   0.000000   0.100000 (  0.099062)