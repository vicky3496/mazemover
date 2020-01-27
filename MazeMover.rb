# receives a string of commands and will output the robot's distance from it's starting point.
# This distance will be the minimum amount of units the robot will need to traverse in order to get back to it's starting point.
# It has 4 functions and each of the function performs a specific task
class MazeMover2
  # This fucntion is to initialise the starting position of the robot to 0,0 on coordinate plane
  def initialize(x, y)
    @x= 0
    @y= 0
  end

  # The splitInput function takes the uer input string and breaks the strings into directions
  def splitInput(user_input)
    input_string = user_input.split ","
  end

  # The parseString fnction takes the array of directions and further breaks down into the direction command and number of moves.
  # Regx is used to make sure the input string is parsed correctly and only takes an Alphabet and Number and ignores rest all symbols
  def parseInput(input_string)
    for dir in input_string do
      # Regular expression to break the string into direction command and no of steps.
      # This will ignore any symbols before the number in the direction command. considers only numbers and alphabets
      # If no number is specified then it is taken as 0.
      directions_array =  dir.scan(/\d+|[A-Za-z]+/)
      Movement(directions_array)
    end
     return [@x,@y]

  end

  # The movement function updates the position of the robot based on the user input command and number of command.
  # F and B are considered to be movements made on x axis
  # R and L are considered to be movements made on Y axis
  def Movement(directions_array)
    directions = directions_array[1].to_i
    if directions_array[0] == "F"

      until directions == 0 do
        @x = @x+1
        directions = directions - 1
      end
    end
    if directions_array[0] == "B"
      until directions == 0 do
        @x = @x-1
        directions = directions - 1
      end
    end
    if directions_array[0] == "L"
      until directions == 0 do
        @y =@y-1
        directions = directions - 1
      end
    end
    if directions_array[0] == "R"
      until directions == 0 do
        @y = @y+1
        directions = directions - 1
      end
    end
    end


  # This function is to calculate the minimum number of steps for the robot to go back to the initial or starting position.
  # Manhattan Distance formula is used as this gives the minimum distance between two points when robot can only move in 4 directions.

  def CalculateManhattanDistance2(initial_pos,final_pos)
    x_val = (final_pos[0] - initial_pos[0]).abs
    y_val = (final_pos[1] - initial_pos[1]).abs
    return x_val + y_val
  end

  # this is a function that checks whether the user given input is the correct command or not.
  # If the input doesnt fall under the correct commands then it displays an error
  def input_validator(input_string)
    for a in input_string do
      directions_array =  a.scan(/\d+|[A-Za-z]+/)
      if !["F","B","R","L"].include? directions_array[0]
        return 2
      else
        next
      end
    end
    return 1
  end
    end

puts "Welcome to the maze runner"
# Taking the input from external .txt file. The program runs one time for each line of input. The program stops when the end of file is reached.
File.open("test.txt").each do |line|
  input = line
  initial_position =[0,0] # setting the initial position if the robot as []0,0]
  # creating an object for the MazeMover class
  obj = MazeMover2.new(0,0)
  # calling a method from the MazeMover which returns the final position of the robot after traversing through all the Direction given by user
  input_string= obj.splitInput(input)
  # Calling input validator fucntion to check if the input is right or wrong
  validate = obj.input_validator(input_string)
  # If the input is right then the robot is moved or else an error is thrown
  if validate == 1
    # calling function to parse input and move the robot
    final_position= obj.parseInput(input_string)
    # Making the function call to calculate the minimum distance from final position to the starting position
    minimum_distance = obj.CalculateManhattanDistance2(initial_position,final_position)
    puts " The minimum distance for the robot to reach starting point is:"
    # Displaying the output on the command line interface
    puts minimum_distance
  end
  if validate == 2
    puts " illegal input"
  end


end

