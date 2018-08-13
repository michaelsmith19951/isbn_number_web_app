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
	isbn2 = isbn.gsub(/[^0-9xX]/,'').gsub(/x/,'X')
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
def isbn13_checksum(isbn)
	isbn2 = isbn
	if isbn2 == "Invalid ISBN"
		false
	else
		checksum_arr = []
		counter = 1
		sum = 0
		isbn2 = isbn2.split("")
		checkdigit = isbn2.pop
		isbn2.each_with_index do |inv, num|
			num = num.to_i
			inv = inv.to_i
			if num.even? == true
				sum += inv * 1
			else
				sum += inv * 3
			end
			p sum
		end
		end
		sum1 = sum % 10
		sum1 = 10 - sum1
	if sum1 == checkdigit.to_i
		true
	else
		false
	end
end
