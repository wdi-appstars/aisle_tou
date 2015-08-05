class BasketController < ApplicationController

  get '/' do
    puts session[:current_user]
    authorization_check

    @user = Users.find_by(:email_address => session[:current_user])
    @basket = Baskets.find_by(:user_id => @user.id)

    @basket_count = 0;
    @basket_items = Basket_items.where(:basket_id => @basket.id)
    @basket_items.each do |item|
      @basket_count += item.item_count
    end

    ApplicationController.total_basket_count = @basket_count 

    @foods = []

    @total_cost = 0

    @basket_items.each do |item|
      food_name = Foods.find(item.food_id).name
      food_cost = Foods.find(item.food_id).price * item.item_count
      @total_cost += food_cost
      @foods.push(:name => food_name, :price => food_cost)

    end

    erb :basket
  end

  post '/' do
    existingItem = Basket_items.find_by(:basket_id => params['basket_id'], :food_id => params['food_id'])
    if existingItem.nil?
      newBasketItem = Basket_items.new
      newBasketItem.food_id = params['food_id']
      newBasketItem.basket_id = params['basket_id']
      newBasketItem.scheduled = false
      newBasketItem.item_count = 1
      newBasketItem.save
    else
      existingItem.item_count += 1
      existingItem.save
    end
  end

end
