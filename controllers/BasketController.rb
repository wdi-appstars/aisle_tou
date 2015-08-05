class BasketController < ApplicationController

  get '/' do
    puts session[:current_user]
    authorization_check

    @foods = []
    get_user_basket
    @basket_items = Basket_items.where(:basket_id => @basket.id)
    @total_cost = 0
    @basket_items.each do |item|
      food_id = item.food_id
      food_name = Foods.find(food_id).name
      food_quantity = item.item_count
      food_cost = Foods.find(food_id).price * food_quantity
      @total_cost += food_cost
      @foods.push(:id => food_id, :name => food_name, :price => food_cost, :quantity => food_quantity) if food_quantity > 0

    end

    erb :basket
  end

  post '/' do
    get_user_basket
    existingItem = Basket_items.find_by(:basket_id => params['basket_id'], :food_id => params['food_id'])
    if existingItem.nil?
      newBasketItem = Basket_items.new
      newBasketItem.food_id = params['food_id']
      newBasketItem.basket_id = params['basket_id']
      newBasketItem.scheduled = false
      newBasketItem.item_count = 1
      newBasketItem.save
      food_price = Foods.find(params['food_id']).price
      @basket.total_price += food_price
      @basket.item_count += 1
      @basket.save

    else
      existingItem.item_count += 1
      existingItem.save
      food_price = Foods.find(params['food_id']).price
      @basket.total_price += food_price
      @basket.item_count += 1
      @basket.save
    end
  end

  post '/remove' do
    get_user_basket
    item_to_remove = Basket_items.find_by(:food_id => params['food_id'])
    puts "item to remove has an item count of: #{item_to_remove.item_count}"
    if item_to_remove.item_count > 0
        item_to_remove.item_count -= 1
        item_to_remove.save
        food_price = Foods.find(params['food_id']).price
        @basket.total_price -= food_price
        @basket.item_count -= 1
        @basket.save
    end
  end

  post '/clear' do
    if params[:clearbasket]
      items_destroy = Basket_items.where(:basket_id => Baskets.find(session[:current_user_id]).id)
      items_destroy.destroy
    end
  end



  def get_user_basket
    @user = Users.find_by(:email_address => session[:current_user])
    @basket = Baskets.find_by(:user_id => @user.id)
  end


end
