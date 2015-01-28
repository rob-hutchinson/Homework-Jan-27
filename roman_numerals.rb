require "minitest/autorun"
require "pry"

=begin
There must be a better way to go about this. We tried a
number of different techniques (we left in vestigial code everywhere)
. Currently, the code works for any roman numeral that doesnt include
combinations of 4, 9, 40, 90, 400, or 900 because 
these are the numbers that can't just be added up by breaking 
each character up into an array, changing them to numbers, and 
adding them. The massive If statement is ugly and awful and could
still can't handle numbers like '904' or '49'.
=end
	

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

	roman = roman.downcase
	integer =0

	if roman == "iv"
		integer = 4
	elsif	roman.include? "iv" 
		integer += 4
		roman = roman[0..roman.length-3]
		roman_array = roman.downcase.split(//)
		stop_at = roman_array.length-2
		
		roman_array.each do |numeral|
		each_num = numerals_hash[numeral]
		number_array.push each_num
		end

		stop_at = number_array.length-1

		(0..stop_at).each do |number|
		integer += number_array[number]
		end
	elsif roman == "ix"
		integer = 9
	elsif roman.include? "ix"
		integer+=9
		roman = roman[0..roman.length-3]
		roman_array = roman.downcase.split(//)
		stop_at = roman_array.length-2
		
		roman_array.each do |numeral|
		each_num = numerals_hash[numeral]
		number_array.push each_num
		end

		stop_at = number_array.length-1

		(0..stop_at).each do |number|
		integer += number_array[number]
		end
	elsif roman == "xl"
		integer = 40
	elsif roman.include? "xl"
		integer+=40
		roman = roman[0..roman.length-3]
		roman_array = roman.downcase.split(//)
		stop_at = roman_array.length-2
		
		roman_array.each do |numeral|
		each_num = numerals_hash[numeral]
		number_array.push each_num
		end

		stop_at = number_array.length-1

		(0..stop_at).each do |number|
		integer += number_array[number]
		end
	elsif roman == "xc"
		integer = 90
	elsif roman.include? "xc"
		integer+=90
		roman = roman[0..roman.length-3]
		roman_array = roman.downcase.split(//)
		stop_at = roman_array.length-2
		
		roman_array.each do |numeral|
		each_num = numerals_hash[numeral]
		number_array.push each_num
		end

		stop_at = number_array.length-1

		(0..stop_at).each do |number|
		integer += number_array[number]
		end
	elsif roman == "cd"
		integer = 400
	elsif roman.include? "cd"
		integer+=400
		roman = roman[0..roman.length-3]
		roman_array = roman.downcase.split(//)
		stop_at = roman_array.length-2
		
		roman_array.each do |numeral|
		each_num = numerals_hash[numeral]
		number_array.push each_num
		end

		stop_at = number_array.length-1

		(0..stop_at).each do |number|
		integer += number_array[number]
		end
	elsif roman == "cm"
		integer = 900
	elsif roman.include? "cm"
		integer+=900
		roman = roman[0..roman.length-3]
		roman_array = roman.downcase.split(//)
		stop_at = roman_array.length-2
		
		roman_array.each do |numeral|
		each_num = numerals_hash[numeral]
		number_array.push each_num
		end

		stop_at = number_array.length-1

		(0..stop_at).each do |number|
		integer += number_array[number]
		end
	else
		roman_array = roman.split(//)
		stop_at = roman_array.length-2
		
		roman_array.each do |numeral|
		each_num = numerals_hash[numeral]
		number_array.push each_num
		end

		stop_at = number_array.length-1

		(0..stop_at).each do |number|
		integer += number_array[number]
		end
	end

	integer

	
# # Replaces the numeral letters in our array with integers via our hash
#     roman_array.each do |numeral|
#     each_num = numerals_hash[numeral]
#     number_array.push each_num
#     end

# # Creates a new 2d array, filled with smaller arrays representing each pair of "letters"
#    	result = []

#  	(0..stop_at).each do |i|
#  		result.push number_array[i..i+1]
#  	end

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
building up to bigger problems with our original method of
comparing pairs of numbers against each other.

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
end

class TestNumerals < Minitest::Test
	def test_check1
		assert_equal 2015, roman_numeral("mmxv")
	end
end

