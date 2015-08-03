#require the Sinatra Base Class
require 'sinatra/base'

Dir.glob("./{controllers, models}/*.rb").each { |file| require file }

map('/') { run HomeController }
map('/basket') { run BasketController }
map('/delivery') { run DeliveryController }
map('/shop') { run ShopController }
map('/users') { run UsersController }
