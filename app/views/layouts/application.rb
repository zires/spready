module Layouts
  class Application < ::Stache::View

    def stylesheet(name)
      theme_stylesheet_link_tag name, :theme => current_theme
    end
    alias_method :css, :stylesheet

    def javascript(name)
      theme_javascript_include_tag name, :theme => current_theme
    end
    alias_method :js, :javascript

    def compiled(name)
      theme_compiled_path(name, current_theme)
    end

    def theme
      current_theme
    end

  end
end