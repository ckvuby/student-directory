

# and then print them
def print_header
  puts "The students of Villians Academy".center(100)
  puts "---------------".center(100)
end

def print(students)
  cohort_arr = {}
    students.each do |co|
      cohort = co[:cohort]
      name = co[:name]
      if cohort_arr[cohort].nil?
        cohort_arr[cohort] = [name]
      else
        cohort_arr[cohort] << name
      end
  end
    cohort_arr.each do | k, v |
    puts "#{k} #{v}\n".center(100)
  end
end   


# finally, we print the total number of students
def print_footer(directory)
  puts "Overall, we have #{directory.count} great students".center(100)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  # create an empty array
  students = []
  
  #get the first name
  name = gets.chomp.capitalize
  
  # while the name is not empty, repeat the code
  while !name.empty? do
    puts "Please enter hobby of student"
    hobby = gets.chomp.capitalize
    puts "Please enter your cohort start month"
    cohort = gets.chomp.to_sym.capitalize
    if cohort.empty?
      cohort = "August".to_sym.capitalize
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort, hobby: hobby}
    puts "Now we have #{students.count} students"
    name = gets.chomp.capitalize
  end
  
  # returns the array of students
  #puts students
  students
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)

