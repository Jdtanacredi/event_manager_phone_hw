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
#def print_numbers
# @file.each do |line|
 # clean_phonenumber = clean_phonenumbers(line[:homephone])
  #puts clean_phonenumber
 #end

 #FIGURE OUT HOW TO GET THIS WORKING!!
# def peak_hours
# time = row[:regdate]
# hr_array = []
# time.each { |t|
 #        array << DateTime.strptime(t, '%m/%d/%Y %H:%M').hour }
 #array
 #end

#USE THIS? hour = Date.strptime(hour, '%H:%M')

 def best_hour #rank_times
  hours = Array.new(24) {0}
  @file.each do |line|
   timestamp = line[:regdate]
   hour = timestamp.split(" ")
   hour = hour[1].split(":")
   hour = hour[0].split.join
   hours[hour.to_i] += 1
  end
  hours.each_with_index {|counter, hours| puts "#{hours}\t#{counter}"}
 end

 def best_day #day_stat
  days = Array.new(7) {0}
  @file.each do |line|
   date_stamp = line[:regdate]
   date = date_stamp.split(" ")
   date = date[0].split.join
   date = Date.strptime(date, "%m/%d/%y")
   day = date.wday
   days[day] = days[day] + 1
  end
  days.each_with_index {|counter, day| puts "#{day}\t#{counter}"}
 end

