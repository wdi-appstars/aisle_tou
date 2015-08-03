#require the Sinatra Base Class
require 'sinatra/base'

# Dir.glob("./{controllers, models}/*.rb").each { |file| require file }
require './controllers/ApplicationController.rb'
require './controllers/BasketController.rb'
require './controllers/DeliveryController.rb'
require './controllers/HomeController.rb'
require './controllers/ShopController.rb'
require './controllers/UsersController.rb'
require './models/UsersModel.rb'
require './models/BasketsModel.rb'
require './models/DeliveriesModel.rb'
require './models/FoodModel.rb'
require './models/FoodCategoriesModel.rb'
require './models/BasketItemsModel.rb'
require './models/TimeOfDaysModel.rb'

map('/') { run HomeController }
map('/basket') { run BasketController }
map('/delivery') { run DeliveryController }
map('/shop') { run ShopController }
map('/users') { run UsersController }
