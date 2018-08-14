require "sinatra"
require_relative "isbn_functions.rb"
enable :sessions

get '/' do
 	isbn_output = isbn_output
	validity_final = validity_final
	isbn_orig = isbn_orig
	erb :isbn_number_main_page, locals:{isbn_output: isbn_output, isbn_orig: isbn_orig, validity_final: validity_final}
end
post '/isbn_number_main_page' do
	puts params
	isbn = params[:isbn] 
	p "test if isbn is #{isbn} on main page"
	isbn2 = isbn.split
	p "#{isbn2} is isbn2 and #{isbn2.class} is isbn2 string and #{isbn2.length} isbn2 length"
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
	erb :isbn_number_main_page, locals:{isbn_output: isbn_output, isbn_orig: isbn_orig, validity_final: validity_final}
end