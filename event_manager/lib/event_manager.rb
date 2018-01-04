
require "csv"

def clean_zipcode(zipcode)
  if zipcode.nil?
    "00000"
  elsif zipcode.length < 5
    zipcode.rjust(5,"0")
  elsif zipcode.length > 5
    zipcode[0..4]
  else
    zipcode
  end
end

puts "EventManager initialized."

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
   zipcode = row[:zipcode]

  # if the zip code is exactly five digits, assume that it is ok
  # if the zip code is more than 5 digits, truncate it to the first 5 digits
  # if the zip code is less than 5 digits, add zeros to the front until it becomes five digits
  zipcode = clean_zipcode(row[:zipcode])

  puts "#{name} #{zipcode}"
end