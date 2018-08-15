def isbn_dash(isbn)
    isbn.to_s
    isbn = isbn.tr('-', '')
    isbn = isbn.tr(' ', '')
    isbn
end
def isbn_characters(isbn)
	isbn2 = isbn_dash(isbn)
	isbn2.to_s
	isbn2 = isbn2.tr("~!@#$%^&*+/", '')
	isbn2 = isbn2.tr(' ', '')
	isbn2
end
def isbn_letters(isbn)
	isbn2 = isbn_characters(isbn)
	isbn2.to_s
	if isbn2.length == 10 && isbn2[-1] == "x"
		isbn2
	elsif isbn2.length == 10 && isbn2[-1] == "X"
		isbn2
	else
		isbn2 = isbn2.tr("a..z", '')
		isbn2 = isbn2.tr(' ', '')
		isbn2
	end
end
def isbn10_valid_chars(isbn2)
	verify = false
	# arr = ["*", "$"]
	# arr.each do |item|
	# 	if isbn2.include?(item)
	# 		verify = true
	# 	end
	# end
	if isbn2[-1] == "x" || isbn2[-1] == "X"
		isbn2_chopped = isbn2.chop
		p "test that isbn2 chopped is #{isbn2_chopped}"
		verify = isbn2_chopped.count("^0-9, []").zero?
	else
		verify = isbn2.count("^0-9, []").zero?
	end
	verify
end
def isbn10_ready(isbn)
	""
	verify = "Invalid ISBN"
	# isbn2 = isbn.gsub(/[^0-9xX]/, '*').gsub(/x/, 'X')
	isbn2 = isbn.gsub(/x/, 'X')
	if isbn10_valid_chars(isbn2) == true
		if isbn2.length != 10
			"Invalid ISBN"
		else
			p "test that isbn2 is #{isbn2}"
			if isbn2.include? "X" 
				if true && isbn2[-1] == "X"
					isbn2
					verify = isbn2
				else
					"Invalid ISBN"
				end
			else
				"Valid ISBN"
				verify = isbn2
			end
		end
	else
		verify = "Invalid ISBN"
	end
	verify
end
def isbn10_checksum(isbn)
	isbn2 = isbn10_ready(isbn)
	if isbn2 == "Invalid ISBN"
		false
	else
		checksum_arr = []
		counter = 1
		isbn2.each_char do |num|
			unless counter > 9
				checksum_arr << (num.to_i * counter)
				counter += 1
			end
		end
		checksum_arr.reduce(:+) % 11
		true
	end
end
# def isbn10_validation(isbn)
# 	isbn10_checker = isbn10_checksum(isbn).to_s
# 	if isbn10_checker == "Invalid ISBN"
# 		"Invalid ISBN"
# 	else
# 		if isbn10_checker == "10" && isbn[-1] == "X" 
# 			"Valid ISBN10"
# 		elsif isbn10_checker == "10" && isbn[-1] == "x"
# 			"Valid ISBN10"
# 		elsif isbn10_checker == isbn[-1]
# 			"Valid ISBN10"
# 		else
# 			"Invalid ISBN"
# 		end
# 	end
# end
def isbn13_valid_chars(isbn2)
	verify = isbn2.count("^0-9, []").zero?
end
def isbn13_ready(isbn2)
	""
	verify = "Invalid ISBN"
	# isbn2 = isbn.gsub(/[^0-9]/,'')
	if isbn13_valid_chars(isbn2) == true
		if isbn2.length != 13
			verify = "Invalid ISBN"
		else
			"Valid ISBN"
			verify = isbn2
		end
	else
			verify = "Invalid ISBN"
	end
		verify
end
def isbn13_checksum(isbn)
	isbn2 = isbn13_ready(isbn)
	if isbn2 == "Invalid ISBN"
		"Invalid ISBN"
		false
	else
		checksum_arr = []
		isbn2.chop.each_char.with_index do |num, index|
			if index % 2 == 0
				checksum_arr  << (num.to_i * 1)
			else
				checksum_arr << (num.to_i * 3)
			end
		end
		(10 - (checksum_arr.reduce(:+)) % 10) % 10
		true
	end 
end
def choose_isbn10_or_isbn13(isbn) 
	if isbn10_ready(isbn) == "Valid ISBN10"
		"Valid ISBN10"
		true
	else 
		if isbn13_ready(isbn) == "Valid ISBN13"
			"Valid ISBN13"
			false
		else
			"Invalid ISBN"
			false
		end
	end
end

# def isbn13_validation(isbn)
# 	isbn13_checker = isbn13_checksum(isbn)
# 	if isbn13_checker == "Invalid ISBN"
# 		"Invalid ISBN"
# 	else
# 		if isbn13_checker.to_s == isbn[-1]
# 			"Valid ISBN13"
# 		else
# 			"Invalid ISBN"
# 		end
# 	end
# end

