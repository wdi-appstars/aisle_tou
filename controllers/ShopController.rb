class ShopController < ApplicationController

 get '/' do

   @foods = []
   foodCats = Food_categories.all
   foodCats.each do |category|
     currentCategory = {}
     currentCategory[:category] = category.name
     currentFoodItems = Foods.where(:category_id => category.id)
     foodList = []
     currentFoodItems.each do |food_item|
       foodList.push(:name => food_item.name, :price => food_item.price)
     end
     currentCategory[:foods] = foodList
     @foods.push(currentCategory)
   end
   erb :shop
 end

end
