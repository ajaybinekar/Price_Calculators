class PriceCalculator
	input = gets.chomp

	arr_input = input.split(',')
	total =0;
	
	count_occur = arr_input.tally
	count_occur.each do |key, value|
		case key
		when "milk"
			total += (value / 2) * 5.00 + (value % 2) * 3.97
		when "bread"
			total += (value / 3) * 6.00 + (value % 3) * 2.17
		when "banana"
			total += value * 0.99
		when "apple"
			total += value * 0.89
		else 
			puts "Item is not found"
		end 
	end
	puts "Total price is #{total.round(2)}"
end