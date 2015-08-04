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

  get '/' do
    @message = 'Welcome!'
    erb :index
  end

  post '/signin' do
    user_email = params['email_address']
    user_password = params['password']
    puts "This is the user's email address: #{user_email}"

    if does_user_exist?(user_email)
      user = Users.where(:email_address => user_email.to_s).first!
      if user.password_hash = BCrypt::Engine.hash_secret(user_password, user.password_salt)
        session[:current_user] = user_email
        redirect '/'
      else
        @message = 'Error: Invalid password'
        puts 'Invalid password'

      end
    else
      @message = 'Error: Invalid email'
      puts 'Invalid email'
    
    end
  end

  post '/signup' do
    if does_user_exist?(params[:email_address])
      redirect '/users/error'
    end
    new_user = Users.new
    new_user.email_address = params[:email_address]
    new_user.password_salt = BCrypt::Engine.generate_salt
    new_user.password_hash = BCrypt::Engine.hash_secret(params[:password], new_user.password_salt)
    new_user.save
  end

  get '/signout' do
    redirect '/users'
  end

end
