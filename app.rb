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
    dough.add_cake(101, "Black Forest Cake", 30.00, "Layers of chocolate sponge cake, cherries, and whipped cream")
    dough.add_cake(102, "Strawberry Shortcake", 25.00, "Layers of sponge cake, fresh strawberries, and whipped cream")
    dough.add_cake(103, "Vanilla Crepe Cake", 35.00, "Paper-thin handmade crêpes layered with light pastry cream")
    @products = dough.cakes
    erb :products
  elsif params[:product] == "cookies"
    dough.add_cookie(101, "Black Forest Cake", 30.00, "Layers of chocolate sponge cake, cherries, and whipped cream")
    dough.add_cookie(102, "Strawberry Shortcake", 25.00, "Layers of sponge cake, fresh strawberries, and whipped cream")
    dough.add_cookie(103, "Vanilla Crepe Cake", 35.00, "Paper-thin handmade crêpes layered with light pastry cream")
    @products = dough.cookies
    erb :products
  elsif params[:product] == "muffins"
    dough.add_muffin(101, "Black Forest Cake", 30.00, "Layers of chocolate sponge cake, cherries, and whipped cream")
    dough.add_muffin(102, "Strawberry Shortcake", 25.00, "Layers of sponge cake, fresh strawberries, and whipped cream")
    dough.add_muffin(103, "Vanilla Crepe Cake", 35.00, "Paper-thin handmade crêpes layered with light pastry cream")
    @products = dough.muffins
    erb :products
  else
    redirect to('/')
  end
end
