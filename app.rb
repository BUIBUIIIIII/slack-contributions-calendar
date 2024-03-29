require 'sinatra'
require 'dotenv'
require 'slack-ruby-client'

Dotenv.load
Slack.configure do |config|
  config.token = ENV["SLACKAPIKEY"]
end

get '/' do
  erb :index
end

get '/conversations_history' do
  client = Slack::Web::Client.new
  # channel = params[:id]
  text = "Hello World"
  # client.chat_postMessage(channel: '#slack-contributions-calendar', text: text)
  @messages = client.conversations_history(channel: 'C04V36GTFEW').to_json
  # @json = messages.to_json
  erb :index
end