# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# # I added this to ignore the graphiql files outside of a development environment
# # This was necessary to get tests to run, see this thread for more info:
# # https://github.com/rmosolgo/graphiql-rails/issues/75#issuecomment-555893869

# Rails.application.config.assets.precompile += %w( graphiql/rails/application.js graphiql/rails/application.css ) if Rails.env.development?
