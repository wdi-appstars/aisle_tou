class HomeController < ApplicationController


  get '/' do

   puts session[:current_user]
   authorization_check
   erb :dashboard
 end

end
