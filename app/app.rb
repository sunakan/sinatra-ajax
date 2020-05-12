require 'sinatra'
set :bind, '0.0.0.0'

get '/' do
  erb :index
end

get '/gray2' do
  erb :'other/user_setting2'
end
