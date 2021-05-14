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
    @size = @sides.uniq.length
    return :equilateral if @size == 1
    return :isosceles if @size == 2
    return :scalene if @size == 3
  end

  class TriangleError < StandardError
  end
end