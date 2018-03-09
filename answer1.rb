def generate_alphabet(number)
	charset = Array('a'..'z')
	Array.new(number) { charset.sample }.join
end

def generate_integer(number)
	charset = Array(0..9)
	Array.new(number) { charset.sample }.join
end

def generate_alphanumeric(number)
	charset = Array(0..9) + Array('a'..'z')
	Array.new(number) { charset.sample }.join
end

def generate_real_numbers(number)
	charset = Array(0..9) + Array('.')
	alpha = Array(1..9)
	a = Array.new(number) { charset.sample }.join
	b = Array.new(1) { alpha.sample }.join
	c = Array.new(1) { alpha.sample }.join
	d = b.concat(a).concat(c)
	numofsymbol = d.count('.')

	if (d.include?(".") && numofsymbol > 1)
		generate_real_numbers(number)
	elsif (d.include?(".") && numofsymbol == 1)
		d
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
	while i <= 100
		row = Array.new(4) {output}
		count = row.join(', ').length
		i += count
		my_file = File.new("result.txt","a")
		my_file.write(row.join(", "))
		my_file.close
	end

end

calculate_file_size



