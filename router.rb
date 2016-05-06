require 'bundler/setup'
require 'sinatra'
require 'json'
# This relies on the existence of a symlink to the html-to-haml code
# for this directory
require_relative './html-to-haml/lib/html_to_haml/converter'

get '/' do
  haml :index
end

post '/convert.json' do
  haml = HtmlToHaml::Converter.new(params[:html]).convert
  content_type :json
  { haml: haml }.to_json
end