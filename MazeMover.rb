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
end

