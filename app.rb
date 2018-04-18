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
    dough.add_cake(101, "Black Forest Cake", 30.00, "Layers of chocolate sponge cake, cherries, and whipped cream.")
    dough.add_cake(102, "Strawberry Shortcake", 25.00, "Layers of sponge cake, fresh strawberries, and whipped cream.")
    dough.add_cake(103, "Vanilla Crepe Cake", 35.00, "Paper-thin handmade crêpes layered with light pastry cream.")
    @products = dough.cakes
    erb :products
  elsif params[:product] == "cookies"
    dough.add_cookie(101, "Macaron", 18.00, "Gift box of 6 in assorted flavors. Choose from dark chocolate, green tea, black sesame, and more.")
    dough.add_cookie(102, "Chocolate Chip Walnut Cookie", 3.50, "Crispy outside with a satisfyingly thick and gooey center. Every bite is packed with semi-sweet chocolate chips and chunks of walnuts.")
    dough.add_cookie(103, "Oatmeal Raisin Cookie", 3.00, "A decadent twist on a classic. 6 ounces each, these rich and buttery cookies are golden brown on the outside, moist on the inside, and full of plump sweet raisins.")
    @products = dough.cookies
    erb :products
  elsif params[:product] == "muffins"
    dough.add_muffin(101, "Banana Muffin", 2.50, "Sweet banana flavor, topped with streusel crumble.")
    dough.add_muffin(102, "Blueberry Muffin", 2.75, "Loaded with fresh blueberries and have a fresh blueberry jam swirl throughout. Topped with sugar for a crunchy bite.")
    dough.add_muffin(103, "Double Chocolate Muffin", 2.50, "Extremely chocolatey and filled with chocolate chips.")
    @products = dough.muffins
    erb :products
  else
    redirect to('/')
  end
end
