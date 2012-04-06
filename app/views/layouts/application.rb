module Layouts
  class Application < ::Stache::View
    include Sprockets::Helpers::RailsHelper

    def stylesheet(name)
      stylesheet_link_tag name
    end
    alias_method :css, :stylesheet

    def javascript(name)
      javascript_include_tag name
    end
    alias_method :js, :javascript

  end
end