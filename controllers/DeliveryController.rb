class DeliveryController < ApplicationController

  get '/' do
    puts session[:current_user]
    authorization_check
    @user = Users.find(session[:current_user_id])
    @basket = Baskets.find_by(:user_id => @user.id)
    @basket_total_price = @basket.total_price
    @basket_item_count = @basket.item_count

    erb :schedule_delivery
  end

end
