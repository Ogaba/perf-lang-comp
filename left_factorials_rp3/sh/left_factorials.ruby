left_fact = Enumerator.new do |y|
  f, lf = 1, 0
  1.step do |n|
    y  << lf #yield left_factorial
    lf += f
    f  *= n
  end
end

tens = 20.step(110, 10)
thousands = 1000.step(10_000, 1000)
 
10001.times do |n|
  lf = left_fact.next
  case n
  when 0..10, *tens
    puts "#{lf}"
  when *thousands
    puts "#{lf.to_s.size}"
  end
end
