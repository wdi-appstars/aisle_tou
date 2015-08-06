class HomeController < ApplicationController


  get '/' do
   @basket = Basket.find_by(:user_id => session[:current_user_id])
   puts session[:current_user]
   authorization_check
   @oldest_sheduled_items = Basket_items.where(:scheduled => true, :basket_id => @basket.id).order('last_scheduled_date ASC')
   @items_to_refresh = []
   @oldest_sheduled_items.each do |item|
    current_food_item = Foods.find(item.food_id)
    age_in_secs = Date.today - item.last_scheduled_date
    # puts item.last_scheduled_date.class
    puts "last_scheduled_date in seconds #{age_in_secs}"
   end
   erb :dashboard
 end

end
