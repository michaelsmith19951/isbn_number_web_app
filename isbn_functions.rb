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