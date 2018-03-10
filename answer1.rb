def generate_alphabet(number)
	charset = Array('a'..'z')
	Array.new(number) { charset.sample }.join
end

def generate_integer(number)
	charset = Array(0..9)
	Array.new(number) { charset.sample }.join
end

def generate_alphanumeric(number)
	char = Array('a'..'z') + Array(0..9)
	Array.new(number) { char.sample }.join
end

def generate_real_numbers(number)
	condition = true
	charset = Array(0..9) + Array('.')
	alpha = Array(1..9)

	while condition == true
	a = Array.new(number) { charset.sample }.join
	b = Array.new(1) { alpha.sample }.join
	c = Array.new(1) { alpha.sample }.join
	d = b.concat(a).concat(c)
	numofsymbol = d.count('.')

	if (d.include?(".") && numofsymbol > 1)
		condition = true
	elsif (d.include?(".") && numofsymbol == 1)
		return d
		condition = false
	end

	end
end

def output 
	random_num = rand(1..10)
	num = rand(1..4)
	if num == 1
		generate_alphabet(random_num)
	elsif num == 2
		generate_integer(random_num)
	elsif num == 3
		generate_alphanumeric(random_num)
	elsif num == 4
		generate_real_numbers(random_num)	
	end		
end

def calculate_file_size
	i = 0
	while i <= 10000000
		row = Array.new(1) {output}
		
		my_file = File.new("result.txt","a")

		if File.size?('result.txt')
			my_file.write(", #{row[0]}")
			count = row[0].length + 2
			i += count
			my_file.close
		else
			my_file.write(row.join(", "))
			count = row[0].length
			i += count
			my_file.close
		end
	end

end

calculate_file_size



