
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
  coh = -1
  name = STDIN.gets.strip

  # while the name is not empty, repeat
    while !name.empty? do
    puts "Which cohort? (enter 1-12 for month, otherwise \'unknown\' will be recorded)"
      coh = STDIN.gets.strip
      if coh.to_i <0 || coh.to_i > 12
        puts "That cohort was not understood, will be logged as unknown"
        coh = 0
      end
      cohort = $cohorts[coh.to_i]
      puts "Do they have hobbies?"
      hobby = STDIN.gets.strip
      puts "Where were they born?"
      pob = STDIN.gets.strip
      puts "And how tall are they?"
      height = STDIN.gets.strip
      add_student(name,cohort,hobby,pob,height)
        if @students.count > 1
          puts "Now we have #{@students.count} students. Would you like to add another name?"
        else
          puts "We have our first student. Would you like to add another?"
        end

    name = STDIN.gets.strip

    end
  # return the array
  @students
end

def add_student(name,cohort,hobby,pob,height)
  @students << {name: name, cohort: cohort.to_sym, hobby: hobby, pob: pob, height: height}
end

def save_students
  file = File.open(filename, "w")
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
    process(STDIN.gets.chomp)
  end
end

def process(selection)
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

def show_students
  print_header
  print_list_of_students
  print_footer(@students)
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |entry|
    name, cohort, hobby, pob, height = entry.chomp.split(',')
    add_student(name,cohort,hobby,pob,height)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
  filename = "students.csv"
  end
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students

interactive_menu
