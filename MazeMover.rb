class Test
  include Distance
  puts "Welcome"
  val = gets
  val2 = val.split ","
  x = 0
  y = 0

  for a in val2 do
    val3 =  a.scan(/\d+|[A-Za-z]+/)
    val4 = val3[1].to_i
    puts val3
    puts val4
    if val3[0] == "F"
      until val4 == 0 do
        x = x+1
        val4 = val4 - 1
      end
    end
    if val3[0] == "B"
      until val4 == 0 do
        x = x-1
        val4 = val4 - 1
      end
    end
    if val3[0] == "L"
      until val4 == 0 do
        y = y-1
        val4 = val4 - 1
      end
    end
    if val3[0] == "R"
      until val4 == 0 do
        y = y+1
        val4 = val4 - 1
      end
    end
  end
  puts x
  puts y
  point1 = [x,y]
  point2 = [0,0]
  puts Math.sqrt(point1.zip(point2).reduce(0) { |sum, p| sum + (p[0] - p[1]) ** 2 }) # Euclidian distance
  # # Manhattan Distance
  answer1 = (point2[0] - point1[0]).abs
  answer2 = (point2[1] - point1[1]).abs
  puts answer1 + answer2
end

