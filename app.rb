require 'sinatra'
require 'sinatra/reloader'
require_relative 'pastry'
require_relative 'menu'

dough = Menu.new

get '/' do
  erb :index
end

get '/:product' do
  if params[:product] == "cakes"
    dough.add_cake(101, "Black Forest Cake", 30, "Layers of chocolate sponge cake, cherries, and whipped cream")
    dough.add_cake(102, "Strawberry Shortcake", 25, "Layers of sponge cake, fresh strawberries, and whipped cream")
    dough.add_cake(103, "Vanilla Crepe Cake", 35, "Paper-thin handmade crêpes layered with light pastry cream")
    # p dough.cakes[101]
    dough.cakes.each
    erb :product
  elsif params[:product] == "cookies"
    erb :product
  elsif params[:product] == "muffins"
    erb :product
  else
    redirect to('/')
  end
end
