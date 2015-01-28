require "minitest/autorun"
require "pry"

def roman_numeral roman
	numerals_hash = {
		"i" => 1, 
		"v" => 5, 
		"x" => 10, 
		"l" => 50, 
		"c" => 100, 
		"d" => 500, 
		"m" => 1000,
		"a" => 4,
		"b" => 9,
		"e" => 40,
		"f" => 90,
		"g" => 400,
		"h" => 900
	}
	
	number_array = []

	roman = roman.downcase
	integer =0

	roman = roman.gsub('iv','a')
	roman = roman.gsub('ix','b')
	roman = roman.gsub('xl','e')
	roman = roman.gsub('xc','f')
	roman = roman.gsub('cd','g')
	roman = roman.gsub('cm','h')

	roman_array = roman.split(//)
	stop_at = roman_array.length-2
	
# # Replaces the numeral letters in our array with integers via our hash
    roman_array.each do |numeral|
    each_num = numerals_hash[numeral]
    number_array.push each_num
    end

	stop_at = number_array.length-1
	(0..stop_at).each do |number|
	integer += number_array[number]
	end

integer

end

class TestNumerals < Minitest::Test
	def test_check1
		assert_equal 994, roman_numeral("cmxciv")
	end
	def test_check2
		assert_equal 5, roman_numeral("v")
	end
	def test_check3
		assert_equal 300, roman_numeral("cCc")
	end
end