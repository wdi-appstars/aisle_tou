class BasketController < ApplicationController

  get '/' do
    authorization_check
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
