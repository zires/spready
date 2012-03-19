module ApplicationHelper

  def theme_javascript_include_tag
    if Spready::Application.config.assets.digest
      '<script type="text/javascript" src="/themes/theme.default-33834eee8c1a1cb29a5fbc3a004d7dda.js"></script>'.html_safe
    else
      javascript_include_tag "theme.default"
    end
  end

end
