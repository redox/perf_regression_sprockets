RegressionSprockets::Application.configure do
  # Bump to expire all assets. The big hammer.
  config.assets.version = 'v1'

  # One for each toplevel asset we compile.
  config.assets.precompile += %w(
    application.css application.js
  )

  # Serve images, CSS, and JavaScript from the CDN. Falls back to the current host.
  ActionController::Base.asset_host = config.x.assets.cdn_host
  ActionMailer::Base.asset_host = config.x.assets.cdn_host
end
