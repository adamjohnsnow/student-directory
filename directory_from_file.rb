
  $cohorts = [:unknown,:january,:february,:march,:april,:may,:june,:july,:august,:september,:october,:november,:december]
  @students = []

def print_header
puts
puts "The Students of Villains Academy"
puts "-------------".center(20)
end

def print_list_of_students
  $cohorts.each do |x|
if (@students.count{|c| c[:cohort] == x}) >0
    puts "#{x.to_s.capitalize} cohort\:"
    @students.each do |student,ind|
      if student[:cohort] == x
        puts "#{student[:name]} (from #{student[:pob]}, likes #{student[:hobby]})"
      end
    end
   end
  end
end

def print_footer(names)
  if names.count > 1
    puts
puts "Overall, we have #{names.count} great students"
puts
else
  puts
  puts "We have a great student"
  puts
end
end

def input_students

  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array

  coh = -1
  # get the first name
  name = gets.strip

  # while the name is not empty, repeat
    while !name.empty? do
    puts "Which cohort? (enter 1-12 for month, otherwise \'unknown\' will be recorded)"
      coh = gets.strip
      if coh.to_i <0 || coh.to_i > 12
        puts "That cohort was not understood, will be logged as unknown"
        coh = 0
      end
      puts "Do they have hobbies?"
      hobbies = gets.strip
      puts "Where were they born?"
      birth = gets.strip
      puts "And how tall are they?"
      tall = gets.strip
          # add the hash to the array
      @students << {name: name, cohort: $cohorts[coh.to_i], hobby: hobbies, pob: birth, height: tall}
        if @students.count > 1
          puts "Now we have #{@students.count} students. Would you like to add another name?"
        else
          puts "We have our first student. Would you like to add another?"
        end

    name = gets.strip

    end
  # return the array
  @students
end
def save_students
  file = File.open("students.csv", "w")
  # iterate over the array
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:pob], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def print_menu
  puts "----------MENU-----------"
  puts "Please select an option:"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save list to CSV file"
  puts "4. Load list from CSV file"
  puts "9. Exit"
  puts "-------------------------"
end

def interactive_menu

  loop do
      print_menu
    # read the input and save it into a variable
    selection = gets.chomp
    # do what the user has asked
    case selection
    when "1"
      @students = input_students
    when "2"
      if @students.length > 0
      show_students
      else
        puts "Sorry, we don\'t currently have any students..."
      end
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
    end
  end
end

def show_students
  print_header
  print_list_of_students
  print_footer(@students)
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort, hobby, pob, height = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, hobby: hobby, pob: pob, height: height}
  end
  file.close
end

interactive_menu
