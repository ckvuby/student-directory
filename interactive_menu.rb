def interactive_menu
  students = []
  
                # 1. print the menu and ask the user what to do
  loop do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
  
                # 2. read the input and save it into a variable
  selection = gets.chomp
                # 3. do what the user has asked
  case selection
    when "1"
      students = input_students            # input the students
    when "2"
      print_header                        #  show the students
      print(students)
      print_footer(students)
    when "9"    
      exit      # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
  end
end