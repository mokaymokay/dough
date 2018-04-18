require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/:product' do
  if params[:product] == "cakes"
    erb :cakes
  elsif params[:product] == "cookies"
    erb :cookies
  elsif params[:product] == "muffins"
    erb :muffins
  else
    redirect to('/')
  end
end
