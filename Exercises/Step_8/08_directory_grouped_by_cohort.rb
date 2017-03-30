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

  $cohorts = [:unknown,:january,:february,:march,:april,:may,:june,:july,:august,:september,:october,:november,:december]

def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print(students)
  $cohorts.each do |x|
if (students.count{|c| c[:cohort] == x}) >0
    puts "#{x.to_s.capitalize} cohort\:"
    students.each do |student,ind|
      if student[:cohort] == x
        puts "#{student[:name]} (from #{student[:pob]}, likes #{student[:hobby]})"
      end
    end
   end
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
  coh = -1
  # get the first name
  name = gets.chomp

  # while the name is not empty, repeat
    while !name.empty? do
    puts "Which cohort? (enter 1-12 for month, otherwise \'unknown\' will be recorded)"
      coh = gets.chomp
      if coh.to_i <0 || coh.to_i > 12
        puts "That cohort was not understood, will be logged as unknown"
        coh = 0
      end
      puts "Do they have hobbies?"
      hobbies = gets.chomp
      puts "Where were they born?"
      birth = gets.chomp
      puts "And how tall are they?"
      tall = gets.chomp
          # add the hash to the array
    students << {name: name, cohort: $cohorts[coh.to_i], hobby: hobbies, pob: birth, height: tall}
    puts "Now we have #{students.count} students. Would you like to add another name?"
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
