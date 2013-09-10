require "csv"
require "sunlight/congress"

Sunlight::Congress.api_key = "43099cda060647608f76e966f3119679"




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


#Do work on form letter and populate with stuff
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol



template_letter = File.read "form_letter.html"

contents.each do |row|
  
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  personal_letter = template_letter.gsub('FIRST_NAME',name)
  personal_letter.gsub!('LEGISLATORS',legislators)

  puts personal_letter
end



