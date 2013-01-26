# config.ru
require 'bundler'
Bundler.setup
Bundler.require
require 'rack'
require 'rack/contrib/try_static'

Rack::Mime::MIME_TYPES.merge!({
  ".webapp" => "application/x-web-app-manifest+json", 
  ".appcache" => "text/cache-manifest"})

use Rack::TryStatic, :root => "output", :urls => %w[/], :try => ['.html', 'index.html', '/index.html']

# Run your own Rack app here or use this one to serve 404 messages:
run lambda{ |env| [ 404, { 'Content-Type' => 'text/html' }, ['404 - page not found'] ] }
