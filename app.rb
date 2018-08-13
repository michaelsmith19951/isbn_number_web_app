require "sinatra"
require_relative "isbn_functions.rb"
enable :sessions

get '/' do
  erb :isbn_number_main_page
end
post '/isbn_number_main_page' do
	isbn = params[:isbn]
	p "test that isbn on main page is #{isbn}"
	redirect '/isbn_number_validation_page'
end
get '/isbn_number_validation_page' do
	isbn = choose_isbn10_or_isbn13(params[:isbn])
	p "test that isbn valid on validation page is #{isbn}"
	redirect '/isbn_number_main_page'
end