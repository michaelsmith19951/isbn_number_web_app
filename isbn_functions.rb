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
def isbn10_ready(isbn)
	""
	isbn2 = isbn.gsub(/[^0-9xX]/, '').gsub(/x/, 'X')
	if isbn2.length != 10
		"Invalid ISBN"
	else
		if isbn2.include? "X" 
			if true && isbn2[-1] == "X"
				isbn2
			elsif true && isbn2[1] != "X"
				"Invalid ISBN"
			else
				"Invalid ISBN"
			end
		else
			"Valid ISBN"
			isbn2
		end
	end
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
def isbn10_validation(isbn)
	isbn10_checker = isbn10_checksum(isbn).to_s
	if isbn10_checker == "Invalid ISBN"
		"Invalid ISBN"
	else
		if isbn10_checker == "10" && isbn[-1] == "X" 
			"Valid ISBN10"
		elsif isbn10_checker == "10" && isbn[-1] == "x"
			"Valid ISBN10"
		elsif isbn10_checker == isbn[-1]
			"Valid ISBN10"
		else
			"Invalid ISBN"
		end
	end
end
def isbn13_ready(isbn)
	""
	isbn2 = isbn.gsub(/[^0-9]/,'')
	if isbn2.length == 13
		isbn2
	else
		"Invalid ISBN"
	end
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
def isbn13_validation(isbn)
	isbn13_checker = isbn13_checksum(isbn)
	if isbn13_checker == "Invalid ISBN"
		"Invalid ISBN"
	else
		if isbn13_checker.to_s == isbn[-1]
			"Valid ISBN13"
		else
			"Invalid ISBN"
		end
	end
end
def choose_isbn10_or_isbn13(isbn)
	if isbn10_validation(isbn) == "Valid ISBN10"
		"Valid ISBN10"
	else 
		if isbn13_validation(isbn) == "Valid ISBN13"
			"Valid ISBN13"
		else
			"Invalid ISBN"
		end
	end
end
def isbn_hash(isbn)
	validity = choose_isbn10_or_isbn13(isbn)
	isbn_hash = {}
	isbn_hash["ISBN"] = "#{isbn}"
	isbn_hash["Validity"] = "#{validity}"
	isbn_hash
end
