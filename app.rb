require "sinatra"
require_relative "isbn_functions.rb"
enable :sessions

get '/' do
 	isbn_output = params[:isbn_output]
	validity_final = params[:validity_final]
	isbn_orig = params[:isbn_orig]
	isbn2 = params[:isbn2]
	erb :isbn_number_main_page, locals:{isbn2: isbn2, isbn_output: isbn_output, isbn_orig: isbn_orig, validity_final: validity_final}
end
post '/isbn_number_main_page' do
	puts params
	isbn = params[:isbn] 
	p "test if isbn is #{isbn} on main page"
	isbn2 = isbn.split
	p "#{isbn2} is isbn2 and #{isbn2.class} is isbn2 class and #{isbn2.length} is isbn2 length on main page"
	isbn_output = {}
	isbn2.each do
		for isbn in isbn2
			isbn_output["Validity"] = choose_isbn10_or_isbn13(isbn)
		end
		isbn_output["Validity"]
	end
	isbn2.each do
		for isbn in isbn2
			isbn_output["ISBN"] = isbn
		end
		isbn_output["ISBN"]
	end
	isbn_orig = isbn_output.values
	validity_final = isbn_output.values
	p "test if isbn orig class is #{isbn_orig.class} on main page"
	p "test if validity final class is #{validity_final.class} on main page"
	erb :isbn_number_main_page, locals:{isbn2: isbn2, isbn_output: isbn_output, isbn_orig: isbn_orig, validity_final: validity_final}
end