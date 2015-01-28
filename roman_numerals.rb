require "minitest/autorun"
require "pry"

def roman_numeral roman
	numerals_hash = {
		"i" => 1, 
		"iv"=> 4,
		"v" => 5, 
		"ix"=> 9,
		"x" => 10, 
		"xl" => 40,
		"l" => 50, 
		"xc" => 90,
		"c" => 100, 
		"cd" => 400,
		"d" => 500, 
		"cm" => 900,
		"m" => 1000,
		}
	number_array = []
# Splits the given roman numeral into an array
    roman_array = roman.downcase.split(//)
    stop_at = roman_array.length-2
  	
# Replaces the numeral letters in our array with integers via our hash
    roman_array.each do |numeral|
    each_num = numerals_hash[numeral]
    number_array.push each_num
    end

# Creates a new 2d array, filled with smaller arrays representing each pair of "letters"
   	result = []

 	(0..stop_at).each do |i|
 		result.push number_array[i..i+1]
 	end

=begin
	
 our code stops working here. We were trying to compare
 each pair of values in the original array to determine
 if the value should be added or subtracted from a running
 integer total that would total up the value of the 
 numeral. 
	

 	
 	stop_at_2 = result.length-1
 	integer = 0
 	

 	(0..stop_at_2).each do |i|
 		if result[i][i] >= result[i][i+1]
 	 		integer += result[i][i]
 	 	else
 	 		integer += (result[i][i+1]-result[i][i])
 	 	end
   	end
 	
   integer
end


Our tests don't make much sense at this point. We were
building smaller problems and small tests to fix them, 
building up to bigger problems

class TestNumerals < Minitest::Test
	 def test_x
	 	assert_equal roman_numeral("x"), 10
	 end	

	 def test_array_split
	 	assert_equal roman_numeral("XI"),["X","I"]
	 end

	 def test_array2
	 	assert_equal roman_numeral("XIVXIL"), [10,1,5,10,1,50]
	 end

	 def test_integer1
	 	assert_equal 60, roman_numeral("LX")
	 end

	 def test_pair_up
		assert_equal roman_numeral("LXXIV"), [[50,10],[10,10],[10,1],[1,5]]
	 end
end
=end

