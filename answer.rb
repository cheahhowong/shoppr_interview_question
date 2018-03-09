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

	if (d.include?(".") && numofsymbol == 1)
		d
	else
		generate_real_numbers(number)
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

row1 = Array.new(4) {output}
row2 = Array.new(4) {output}
row3 = Array.new(4) {output}
finalrow = row1.concat(row2).concat(row3)

puts row1.join(', '),row2.join(', '),row3.join(', ')

def final(result)

	result.each do |t|		
		if t.include?('.')
			puts t + ' - real numbers'
		elsif t[/[a-z]/] && t[/\d/]
			puts t + ' - alphanumeric'
		elsif t[/[a-z]/]
			puts t + ' - alphabetical strings'
		elsif t[/\d/]
			puts t + ' - integer'
		end				
	end

end

final(finalrow)
