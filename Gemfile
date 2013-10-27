#------------------------------------------------------------------------
# Gemfile
#------------------------------------------------------------------------

source 'http://rubygems.org'

gem "middleman",            "~> 3.1.4"
gem "middleman-livereload", "~> 3.1.0"

# For the Rake task that deploys to a remote gh-pages branch
gem "middleman-gh-pages"

# Cross-templating language block fix for Ruby 1.8
platforms :mri_18 do
  gem "ruby18_source_location"
end

gem "bootstrap-sass"