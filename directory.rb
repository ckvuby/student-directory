

# and then print them
def print_header
  puts "The students of Villians Academy"
  puts "---------------"
end

def print(students)
  n = 0
  while n < students.length
    puts "#{students[n][:name]} (#{students[n][:cohort]} cohort)" 
    n += 1  
  end
end   

# finally, we print the total number of studentss
def print_footer(directory)
  puts "Overall, we have #{directory.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  #get the first name
  name = gets.chomp
  # while the name is not empty, repeat the code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  # returns the array of students
  students
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)

