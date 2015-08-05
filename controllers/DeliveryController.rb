class DeliveryController < ApplicationController

  get '/' do
    puts session[:current_user]
    authorization_check
    erb :schedule_delivery
  end

end
