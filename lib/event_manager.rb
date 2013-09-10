require "csv"
require "sunlight/congress"

Sunlight::Congress.api_key = "43099cda060647608f76e966f3119679"

# def clean_zipcode(zipcode)
# 	if zipcode.nil?
# 		"00000"
# 	elsif  zipcode.length < 5
# 		zipcode.rjust(5, "0")
# 	elsif zipcode.length > 5
# 		zipcode[0..4]
# 	else
# 		zipcode
# 	end
# end


def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5, "0")[0..4]
	end		

def legislators_by_zipcode(zipcode)
	legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
		legislator_names = legislators.collect do |legislator|
		"#{legislator.first_name} #{legislator.last_name}"
	end

	legislators_string = legislator_names.join(", ")
end

			

puts "Everything Intialized"

# exists = File.exists? "event_attendees.csv"
# puts exists

# contents = File.read "event_attendees.csv"
# puts contents


# The hard way of parsing a CSV
# lines = File.readlines "event_attendees.csv"
# lines.each_with_index do |line, index|
# 	next if index == 0
# 	columns = line.split(",")
# 	name = columns[2]
# 	puts name
# 	index
# end

# contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
# 	name = row[:first_name]
# 	puts name
# end



contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	legislators = legislators_by_zipcode(zipcode)
	

	puts "#{name} #{zipcode} #{legislators}"

end


