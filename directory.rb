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
  name = STDIN.gets.strip.capitalize
  
  # while the name is not empty, repeat the code
  while !name.empty? do
    puts "Please enter your cohort start month"
    cohort = STDIN.gets.strip.to_sym.capitalize
    if cohort.empty?
      cohort = "August".to_sym.capitalize
    end
    # add the student hash to the array
    info = {name: name, cohort: cohort}
    students_toarray(info)
    if @students.length > 1
      puts "Now we have #{@students.count} students".center(100)
    else
      puts "Now we have #{@students.count} student".center(100)
    end
    name = STDIN.gets.strip.capitalize
  end
  @students
end


def interactive_menu
  # 1. print the menu and ask the user what to do
  loop do
  print_menu
  process(STDIN.gets.chomp)
  end
end


def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
  when "3"              # save the students & cohort to students.csv
    save_students
  when "4"
    load_students       # load the students from file
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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    data_from_file = {name: name, cohort: cohort.to_sym}
    students_toarray(data_from_file)
  end
  file.close
end

def try_load_students
  filename = ARGV.first           # first argument of the command line
  return if filename.nil?         # get out of the method if it isn't given
  if File.exist?(filename)        # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else              # if it doesnt exist
    puts "Sorry, #{filename} doesn't exist, loading default students.csv"
    load_students
  end
end

def students_toarray(data)
  @students << data
end

try_load_students
interactive_menu