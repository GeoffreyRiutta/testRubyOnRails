
class StringCalc

  def self.add(input)
   if input.empty?
     return 0
   end
   number = input.split(",").map{|num| num.to_i}
   number.inject(0){|sum, number| sum + number}
  end

end

