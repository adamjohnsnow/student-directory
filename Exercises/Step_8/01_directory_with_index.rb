=begin
#put the students in an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Micharl Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Kruger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
=end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print(students)
  students.each_with_index do |student,ind|
    puts "#{ind+1}: #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat
    while !name.empty? do
    # add the hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get next name from the user
    name = gets.chomp
    end
  # return the array
  students
end

students = input_students
print_header
print(students)
print_footer(students)
