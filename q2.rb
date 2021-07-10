require "benchmark"

puts 'かっこの長さを入力して下さい'
target_length = gets.to_i
return if target_length.odd?

Benchmark.bm do |x|
  x.report do 
    target_size = target_length / 2
    valid_blackets =  [["()"]]
    answer = []
    1.upto(target_size) do |n|
      answer = valid_blackets.first if target_size == 1
      next if n == 1

      n -= 1
      if n == target_size - 1
        valid_blackets[n - 1].each do |blacket|
          answer <<  blacket + "()"
          answer <<  "(" + blacket + ")"
        end
      else
        valid_blackets[n] = []
        valid_blackets[n - 1].each do |blacket|
          valid_blackets[n] <<  blacket + "()"
          valid_blackets[n] <<  "(" + blacket + ")"
        end
      end
    end
  end
end
# あ、答えを出力する行は省いてます笑
