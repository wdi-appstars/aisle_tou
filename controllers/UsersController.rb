class UsersController < ApplicationController

  # does username exist?
  def does_user_exist?(email)
    user = Users.find_by(:email_address => email.to_s)
    if user
      return true
    else
      return false
    end
  end

  def create_basket(user_id)
    empty_basket = Baskets.new
    empty_basket.user_id = user_id
    empty_basket.item_count = 0
    empty_basket.total_price = 0
    empty_basket.save
  end

  get '/' do
    erb :index
  end

  post '/signin' do
    user_email = params[:email_address]
    user_password = params['password']
    puts "This is the user's email address: #{user_email}"

    if does_user_exist?(user_email)
      user = Users.where(:email_address => user_email.to_s).first!
      if user.password_hash = BCrypt::Engine.hash_secret(user_password, user.password_salt)
        session[:current_user] = user_email
        session[:current_user_id] = user.id
        redirect '/'
      else
        status 403

      end
    else
      status 403
    end
  end

  post '/signup' do
    if does_user_exist?(params[:email_address])
      status 400
    else
      new_user = Users.new
      new_user.email_address = params[:email_address]
      new_user.password_salt = BCrypt::Engine.generate_salt
      new_user.password_hash = BCrypt::Engine.hash_secret(params[:password], new_user.password_salt)
      new_user.save
      session[:current_user] = params[:email_address]
      session[:current_user_id] = new_user.id
      self.create_basket(new_user.id)
    end
  end

  get '/signout' do
    session[:current_user] = nil
    session[:current_user_id] = nil
    redirect '/users'
  end

  get '/api/user/*/basketcount' do
    puts params['splat'][0]
    @user = Users.find(params['splat'][0])
    @basket = Baskets.find_by(:user_id => @user.id)
    @basket_count = @basket.item_count
    # @basket_items = Basket_items.where(:basket_id => @basket.id)
    # @basket_count = 0;
    # @basket_items.each do |item|
    # @basket_count += item.item_count
    # end
    {:user_id => @user.id, :basket_count => @basket_count}.to_json
  end

end
