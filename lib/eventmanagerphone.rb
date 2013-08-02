require 'csv'
require 'sunlight/congress'
require 'erb'

#api key
Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  name = row[:first_name]
  phone = row[:homephone]


  def clean_phonenumber(phone)

  if phone.nil?
    phone = "0000000000"
#If the phone number is less than 10 digits assume that it is a bad number

  elsif phone.length < 10
  phone = "0000000000"
#should not have to use this, should print automatically
  elsif phone.length == 10
#If the phone number is 11 digits and the first number is 1, trim the 1 and use the first 10 digits
  elsif phone.length == 11 && phone[0] == 1
  phone = phone[1..phone.length]
#If the phone number is 11 digits and the first number is not 1, then it is a bad number
  elsif phone == 1 && phone[0] != 1
  phone = "0000000000"
#If the phone number is more than 11 digits assume that it is a bad number
  elsif phone.length > 11
  phone = "0000000000"
  end
  phone
#If the phone number is 10 digits assume that it is good
end

end

def print_numbers
 @file.each do |line|
  clean_number = clean_numbers(line[:homephone])
  puts clean_number
 end




