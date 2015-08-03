class UsersController < ApplicationController

  get '/' do
    erb :index
  end

  get '/signout' do
    redirect '/users'
  end

end
