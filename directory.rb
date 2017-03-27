#put the students in an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Micharl Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Kruger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
#then print the list of students
puts "The students of Villains Academy"
puts "-------------"
  students.each do |student|
    puts student
  end
#finally, we print the total number of students
print "Overall, we have #{students.count} great students"
