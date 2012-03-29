# Convention over configuration.
# 
# app/
# - themes
#   - [theme_name]
#     |- assets
#        |- images
#        |- javascripts
#        |- stylesheets
#        |- compiled           -> Compiled static files
#     |- views
#        |- layouts
#
# Uncomment below lines if you really need to.
# ===
ThemePark.setup do |config|

  config.root     = "/sp-themes/"
  config.handlers = [:mustache]
end
# ===