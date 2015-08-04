class ApplicationController < Sinatra::Base

  require 'bundler'
  Bundler.require()

  # connect to database
  ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'aisle_tou'
  )

  # set views folder to where all erb's file live
  set :views, File.expand_path('../../views', __FILE__)
  # set the public folder for access to the styles and JavaScript
  set :public, File.expand_path('../../public', __FILE__)

  # logging allows developers to see how users interacts with website. Use when the site goes live.
  # configure :production, :development do
  #   enable :logging
  # end

  

  # Helper functions for the app
  def current


 # will be used to display 404 pages
 not_found do
   title 'Not Found!'
   erb :not_found
 end

# takes user to the about page
 get '/about' do
   erb :about
 end

end
