require 'pry'
require 'irb'

class Triangle

  attr_reader :sides

  def initialize(side_1, side_2, side_3)
    @side_1, @side_2, @side_3 = side_1, side_2, side_3
    @sides = [@side_1, @side_2, @side_3]
  end

  def follows_triangle_inequality?
    if @side_1 + @side_2 > @side_3
      if @side_1 + @side_3 > @side_2
        if @side_2 + @side_3 > @side_1
          true
        end
      end
    else
      false
    end
  end

  def invalid?
    @sides.any? {|i| i < 0}
  end

  def kind
    raise TriangleError if invalid? || !follows_triangle_inequality?
    # else
    @size = @sides.uniq.length
    return :equilateral if @size == 1
    return :isosceles if @size == 2
    return :scalene if @size == 3
    # end
  end

  class TriangleError < StandardError
  end
end

# IRB.start
# :equilateral - all sides the same length
# :isosceles - 2 sides of the same length
# :scalene - all sides of different length
# triangle_inequality_principle - the sum of the lengths of any 2 sides always exceeds the length of the 3rd side