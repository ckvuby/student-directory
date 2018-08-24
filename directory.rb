@students = [] # an empty array accessible to all methods

def print_header
  puts "The students of Villians Academy".center(100)
  puts "---------------".center(100)
end

def print_students_list(students)
  cohort_hash = {}
    @students.each do |co|
      cohort = co[:cohort]
      name = co[:name]
      if cohort_hash[cohort].nil?
        cohort_hash[cohort] = [name]
      else
        cohort_hash[cohort] << name
      end
  end
    cohort_hash.each do | k, v |
    puts "#{k} #{v}\n".center(100)
  end
end   

# finally, we print the total number of students
def print_footer(directory)
  if directory.length > 1
    puts "Overall, we have #{directory.count} great students".center(100)
  else
    puts "Overall, we have #{directory.count} great student".center(100)
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = gets.strip.capitalize
  
  # while the name is not empty, repeat the code
  while !name.empty? do
    puts "Please enter your cohort start month"
    cohort = gets.strip.to_sym.capitalize
    if cohort.empty?
      cohort = "August".to_sym.capitalize
    end
    # add the student hash to the array
    @students << {name: name, cohort: cohort}
    if @students.length > 1
      puts "Now we have #{@students.count} students".center(100)
    else
      puts "Now we have #{@students.count} student".center(100)
    end
    name = gets.strip.capitalize
  end
  @students
end


def interactive_menu
  # 1. print the menu and ask the user what to do
  loop do
  print_menu
  process(gets.chomp)
  end
end


def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"  
end

#  show the students
def show_students
  print_header                        
  print_students_list(@students)
  print_footer(@students)
end

# 3. do what the user has asked
def process(selection)
  case selection
  when "1"
    @students = input_students            # input the students
  when "2"
    show_students        #  show the students
  when "3"
    save_students
  when "9"    
    exit      # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def save_students
                # open the file for writing
  file = File.open("students.csv", "w")
                # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


interactive_menu