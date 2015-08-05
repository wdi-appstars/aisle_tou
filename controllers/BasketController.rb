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
      @foods.push(:id => food_id, :name => food_name, :price => food_cost, :quantity => food_quantity) if (food_quantity > 0 && item.scheduled == false)

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
      basket_to_clear = Baskets.find_by(:user_id => session[:current_user_id])
      basket_id_to_clear = basket_to_clear.id
      basket_to_clear.item_count = 0
      basket_to_clear.total_price = 0.0
      basket_to_clear.save
      puts "Basket ID to clear is #{basket_id_to_clear}"
      items_destroy = Basket_items.where(:basket_id => basket_id_to_clear)
      items_destroy.each do |item|
        item.destroy
      end
    end
    # status 200
    {:name => 'qoeks'}.to_json
  end



  def get_user_basket
    @user = Users.find_by(:email_address => session[:current_user])
    @basket = Baskets.find_by(:user_id => @user.id)
  end


end
