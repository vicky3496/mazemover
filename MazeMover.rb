class MazeMover

  def splitInput(user_input)
    input_string = user_input.split ","
    parseInput(input_string)
  end

  def parseInput(input_string)
    x=0
    y=0
    for dir in input_string do
      directions_array =  dir.scan(/\d+|[A-Za-z]+/)
      directions = directions_array[1].to_i
      if directions_array[0] == "F"
        until directions == 0 do
          x = x+1
          directions = directions - 1
        end
      end
      if directions_array[0] == "B"
        until directions == 0 do
          x = x-1
          directions = directions - 1
        end
      end
      if directions_array[0] == "L"
        until directions == 0 do
          y = y-1
          directions = directions - 1
        end
      end
      if directions_array[0] == "R"
        until directions == 0 do
          y = y+1
          directions = directions - 1
        end
      end
    end
    return [x,y]
  end


  def CalculateManhattanDistance(initial_pos,final_pos)
    x_val = (final_pos[0] - initial_pos[0]).abs
    y_val = (final_pos[1] - initial_pos[1]).abs
    return x_val + y_val
  end
  end

puts "Welcome to the maze runner"
File.open("test.txt").each do |line|
  input = line
  initial_position =[0,0]
  obj = MazeMover.new
  final_position = obj.splitInput(input)
  minimum_distance = obj.CalculateManhattanDistance(initial_position,final_position)
  puts " The minimum distance for the robot to reach starting point is:"
  puts minimum_distance

end
