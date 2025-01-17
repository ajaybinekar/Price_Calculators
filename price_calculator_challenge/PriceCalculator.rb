class PriceCalculator
	input = gets.chomp
	arr_input = input.split(',')
	milk =0;
	bread =0;
	banana =0;
	apple =0;
	total1 =0;
	total2 =0;
	total3 =0;
	total4 =0;
	without_discount =0;
	count_occur = arr_input.tally
	count_occur.each do |key, value|
		case key
		when "milk"
			milk += value
			total1 += (value / 2) * 5.00 + (value % 2) * 3.97
			without_discount += value * 3.97
		when "bread"
			bread += value
			total2 += (value / 3) * 6.00 + (value % 3) * 2.17
			without_discount += value * 2.17
		when "banana"
			banana += value
			total3 += value * 0.99
			without_discount += total3
		when "apple"
			apple += value;
			total4 += value * 0.89
			without_discount += total4
		else 
			puts "Item is not found"
		end 
	end

	all_total = total1+total2+total3+total4
	puts "---------------------------------------------"
	puts "     Items   quantity          Price      "
	puts "---------------------------------------------"
	puts "    Milk       #{milk}          #{total1}   "
	puts "    Bread      #{bread}         #{total2}"
	puts "    Banana     #{banana}         #{total3}"
	puts "    Apple      #{apple}         #{total4}"
	puts "----------------------------------------------"
	puts "Total price is:     #{all_total.round(2)}"
	puts "----------------------------------------------"
	puts "Save       #{(without_discount - all_total).round(2) }"
	puts "----------------------------------------------"
end
