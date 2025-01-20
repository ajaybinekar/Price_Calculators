class PriceCalculator
	def initialize
		puts "Enter the Items"
		@input = gets.chomp
		@split_input = @input.split(',')
		@milk =0;
		@bread =0;
		@banana =0;
		@apple =0;
		@total1 =0;
		@total2 =0;
		@total3 =0;
		@total4 =0;
		@without_discount =0;
	end

	def tally_item
		count_occur = total_occur(@split_input)
		count_occur.each do |key, value|
			case key
			when 'milk'
				calculate_milk(value)
			when 'bread'
			calculate_bread(value)
			when 'banana'
				calculate_banana(value)
			when 'apple'
       calculate_apple(value)
			else
				puts "Item is not present"
			end
		end
	end

	def calculate_milk(value)
		 @milk += value
		 @total1 = (value/2) * 5.00 + (value % 2) * 3.97
		 @without_discount += value * 3.97
	end
	def calculate_bread(value)
		 @bread += value
		 @total2 = (value/3) * 5.00 + (value % 3) * 2.17
		 @without_discount += value * 2.17
	end
	def calculate_banana(value)
		 @banana += value
		 @total3 = value * 0.97
		 @without_discount += @total3
	end
	def calculate_apple(value)
		 @apple += value
		 @total4 = value * 0.87
		 @without_discount += @total4
	end
	def total_occur(names)
		names.to_h{ |name| [name, names.count(name)] }
	end


	def print_receipt
		all_total = @total1+@total2+@total3+@total4
		save_value = (@without_discount - all_total).round(2)
		puts "---------------------------------------------"
		puts "     Items   quantity          Price      "
		puts "---------------------------------------------"
		puts "    Milk       #{@milk}          #{@total1}   "
		puts "    Bread      #{@bread}         #{@total2}"
		puts "    Banana     #{@banana}         #{@total3}"
		puts "    Apple      #{@apple}         #{@total4}"
		puts "----------------------------------------------"
		puts "Total price is:     #{all_total.round(2)}"
		puts "----------------------------------------------"
		puts "Save       #{ save_value > 0 ? save_value : 0 }"
		puts "----------------------------------------------"
	end
end

calculate = PriceCalculator.new
calculate.tally_item
calculate.print_receipt