require 'bundler/setup'
require 'sinatra'
require 'json'
require 'html_to_haml/converter.rb'

get '/' do
  haml :index
end

post '/convert.json' do
  content_type :json
  begin
    haml = HtmlToHaml::Converter.new(params[:html]).convert
    { haml: haml }.to_json
  rescue HtmlToHaml::ParseError => e
    status 422
    { error: e.message }.to_json
  end
end