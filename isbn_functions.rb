def isbn_dash(num)
    num.to_s
    num = num.tr('-', '')
    num = num.tr(' ', '')
    num
end
def isbn_letters(alphabet)
	alphabet.to_s
	alphabet = alphabet.tr("a..z", '')
	alphabet = alphabet.tr(' ', '')
	alphabet
end
def isbn_characters(characters)
	characters.to_s
	characters = characters.tr("~!@#$%^&*+/", '')
	characters = characters.tr(' ', '')
	characters
end