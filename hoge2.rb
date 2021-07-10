require "benchmark"

Benchmark.bm do |x|
  x.report do 
    @initial = true
    def insert_blacket(return_until_this_count, base_blacket_array = '()'.chars, current_blackets = [])
      base_blacket_array = current_blackets unless current_blackets.empty?
      if @initial
        base_blacket_array.each_with_index do |_, index|
          current_blackets << base_blacket_array.clone.insert(index, '()').join
        end
      else
        base_blacket_array.each_with_index do |blacket, _|
          (0..blacket.size - 1).each do |num|
            current_blackets << blacket.clone.insert(num, '()').join
          end
        end
      end
      current_result_index = current_blackets.uniq.map(&:chars)
      return current_result_index.uniq.map(&:join) if current_result_index.first.size == return_until_this_count
      @initial = false
      insert_blacket(return_until_this_count, current_blackets = current_result_index)
    end
    puts 'かっこの長さを入力して下さい'
    return_until_this_count = gets.to_i
    return if return_until_this_count.odd?
    blackets = insert_blacket(return_until_this_count)
    puts "正しいかっこの数は#{blackets.size}個です"
    blackets.each do |blacket|
      p blacket
    end
  end
end