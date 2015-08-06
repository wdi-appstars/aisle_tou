class HomeController < ApplicationController


  get '/' do
   @basket = Baskets.find_by(:user_id => session[:current_user_id])
   puts session[:current_user]
   authorization_check
   @oldest_sheduled_items = Basket_items.where(:scheduled => true, :basket_id => @basket.id).order('last_scheduled_date ASC')
   @restock_message = ''
   @deliveries_message = ''
   @items_to_refresh = []
   @oldest_sheduled_items.each do |item|
    current_food_item = Foods.find(item.food_id).name
    current_age = (Date.today - item.last_scheduled_date).to_i
    if (current_age > 0)
      @items_to_refresh.push({:food => current_food_item, :age => current_age})
    end
    puts "Date today: #{Date.today}, Date before: #{item.last_scheduled_date}, Difference is:  #{(Date.today - item.last_scheduled_date).to_i}"
   end

   @pending_deliveries = Deliveries.where({:user_id => session[:current_user_id]}).where('date > ?', Date.today)

   if @items_to_refresh.length == 0
     @restock_message = "No old items to restock"
   end

   if @pending_deliveries.length == 0
     @deliveries_message = "No pending deliveries"
   end

   erb :dashboard
 end

end
