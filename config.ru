#require the Sinatra Base Class
require 'sinatra-base'

Dir.glob("./{controllers, models}/*.rb").each { |file| require file }
