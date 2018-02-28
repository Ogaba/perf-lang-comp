hamming = Enumerator.new do |yielder|
  next_ham = 1
  queues = [[ 2, []], [3, []], [5, []] ]
 
  loop do
    yielder << next_ham   # or: yielder.yield(next_ham)
 
    queues.each {|m,queue| queue << next_ham * m}
    next_ham = queues.collect{|m,queue| queue.first}.min
    queues.each {|m,queue| queue.shift if queue.first==next_ham}
  end
end

start = Time.now
 
hamming.each.with_index(1) do |ham, idx|
  case idx
  when (1..20), 1691
    #puts "#{idx} => #{ham}"
    puts "#{ham}"
  when 1_000_000
    #puts "#{idx} => #{ham}"
    puts "#{ham}"
    break
  end
end
