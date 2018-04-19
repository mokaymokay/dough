require_relative 'pastry'
require_relative 'menu'

require 'sinatra'
require 'sinatra/reloader'
require 'sendgrid-ruby'
include SendGrid

# create menu by adding to hashes
dough = Menu.new
dough.add_cake(101, "Chocolate Cake", 30.00, "Rich and chocolatey")
dough.add_cake(102, "Strawberry Shortcake", 25.00, "Layers of sponge cake, fresh strawberries, and whipped cream.")
dough.add_cake(103, "Vanilla Crepe Cake", 35.00, "Paper-thin handmade crêpes layered with light pastry cream.")
dough.add_cookie(201, "Macaron", 18.00, "Gift box of 6 in assorted flavors. Choose from dark chocolate, green tea, black sesame, and more.")
dough.add_cookie(202, "Chocolate Chip Cookie", 3.50, "Crispy outside with a satisfyingly thick and gooey center. Every bite is packed with semi-sweet chocolate chips.")
dough.add_cookie(203, "Oatmeal Raisin Cookie", 3.00, "A decadent twist on a classic. 6 ounces each, these rich and buttery cookies are golden brown on the outside, moist on the inside, and full of plump sweet raisins.")
dough.add_muffin(301, "Banana Muffin", 2.50, "Sweet banana flavor, topped with streusel crumble.")
dough.add_muffin(302, "Blueberry Muffin", 2.75, "Loaded with fresh blueberries and have a fresh blueberry jam swirl throughout. Topped with sugar for a crunchy bite.")
dough.add_muffin(303, "Double Chocolate Muffin", 2.50, "Extremely chocolatey and filled with chocolate chips.")
p dough.get_all

get '/' do
  erb :index
end

get '/:product' do
  if params[:product] == "cakes"
    @products = dough.cakes
    erb :products
  elsif params[:product] == "cookies"
    @products = dough.cookies
    erb :products
  elsif params[:product] == "muffins"
    @products = dough.muffins
    erb :products
  elsif params[:product] == "all"
    @products = dough.get_all
    erb :products
  else
    redirect to('/')
  end
end

post '/catalog' do
  subject = "this catalog dough"
  email_content = "all you knead is loaf"

  def send_email(subject, email_content)
    from = Email.new(email: 'kaymok3@gmail.com')
    to = Email.new(email: params[:email])
    content = Content.new(type: 'text/plain', value: email_content)
    mail = Mail.new(from, subject, to, content)
    p mail
    # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    # response = sg.client.mail._('send').post(request_body: mail.to_json)
    # p response.status_code #test
  end

  send_email(subject, email_content)
  redirect to('/')
end
