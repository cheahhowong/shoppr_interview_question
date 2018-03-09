def final
	abcd = File.read("result.txt")
	
	abcd.split(", ").each do |t|		
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

final