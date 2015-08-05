class DeliveryController < ApplicationController

  get '/' do
    puts session[:current_user]
    authorization_check
    get_user_basket
    @basket_total_price = @basket.total_price
    @basket_item_count = @basket.item_count
    @time_of_days = Time_of_days.all
    erb :schedule_delivery
  end

  post '/success' do
    @delivery_time = Time_of_days.find(params['time_of_day']).name
    puts "post for new delivery successful"
    @delivery_date = params['delivery_date']
    @time_of_day = params['time_of_day']
    get_user_basket
    new_delivery = Deliveries.new
    new_delivery.date = @delivery_date
    new_delivery.time_of_day_id = @time_of_day
    new_delivery.basket_id = @basket.id
    new_delivery.user_id = @user.id
    new_delivery.save

    basket_items_to_deliver = Basket_items.where(:scheduled => false)

    basket_items_to_deliver.each do |item|
      item.scheduled = true
      item.item_count = 0
      item.last_scheduled_date = @delivery_date
      item.save
    end

    @basket.item_count = 0
    @basket.total_price = 0
    @basket.save

    erb :delivery_success
  end

  post '/cancel' do
     erb :delivery_cancel
   end

  # helper function to write DRY code (not repeat code)
def get_user_basket
  @user = Users.find(session[:current_user_id])
  @basket = Baskets.find_by(:user_id => @user.id)
end

end
