class ShopController < ApplicationController

 get '/' do
   authorization_check
   @foods = []
   foodCats = Food_categories.all
   foodCats.each do |category|
     currentCategory = {}
     currentCategory[:category] = category.name
     currentFoodItems = Foods.where(:category_id => category.id)
     foodList = []
     currentFoodItems.each do |food_item|
       foodList.push(:name => food_item.name, :price => food_item.price, :food_id => food_item.id)
     end
     currentCategory[:foods] = foodList
     @foods.push(currentCategory)
   end

   @basket = Baskets.find_by(:user_id => Users.where(:email_address => session[:current_user]).first!.id)

   erb :shop
 end

end
