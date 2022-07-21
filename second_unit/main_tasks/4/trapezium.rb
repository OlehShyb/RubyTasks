require_relative 'point'
class Trapezium
  attr_accessor :a, :b, :c, :d

  def input_coordinate
    gets.to_i
  end

  def point_correct?(point)
    if point.x.class == Integer && point.y.class == Integer
      true
    else
      false
    end
  end

  def initialize
    puts 'Enter x and y for point A: '
    @a = Point.new(input_coordinate, input_coordinate)
    puts 'Enter x and y for point B: '
    @b = Point.new(input_coordinate, input_coordinate)
    puts 'Enter x and y for point C: '
    @c = Point.new(input_coordinate, input_coordinate)
    puts 'Enter x and y for point D: '
    @d = Point.new(input_coordinate, input_coordinate)
  end

  def right_horizontal_order
    x_array = Array.new
    tmp = Array.new
    order = Array.new

    x_array.push(@a.x, @b.x, @c.x, @d.x)
    tmp.push(@a.x, @b.x, @c.x, @d.x)

    x_array.sort!
    x_array.each { |e| order.push(tmp.find_index(e))}
    order
  end

  def replace_points(order)
    points = [@a, @b, @c, @d]
    new_points = Array.new
    order.each do |index|
      new_points.push(points[index])
    end
    @a = new_points[0]
    @b = new_points[1]
    @c = new_points[2]
    @d = new_points[3]
  end

  def sides
    @ab = Math.sqrt((@b.x - @a.x) * (@b.x - @a.x) + (@b.y - @a.y) * (@b.y - @a.y))
    @bc = Math.sqrt((@c.x - @b.x) * (@c.x - @b.x) + (@c.y - @b.y) * (@c.y - @b.y))
    @cd = Math.sqrt((@d.x - @c.x) * (@d.x - @c.x) + (@d.y - @c.y) * (@d.y - @c.y))
    @da = Math.sqrt((@a.x - @d.x) * (@a.x - @d.x) + (@a.y - @d.y) * (@a.y - @d.y))
    sides = {left_lateral: @ab, right_lateral: @cd}
    if @bc > @da
      sides.store(:smaller_basis, @da)
      sides.store(:larger_basis, @bc)
    else
      sides.store(:smaller_basis, @bc)
      sides.store(:larger_basis, @da)
      sides
    end
  end

  def parallel_bases?

  end

  def equilateral?
    sides[:left_lateral] == sides[:right_lateral]
  end

  def area
    tmp = sides
    if tmp[:left_lateral] == tmp[:right_lateral]
      c = tmp[:left_lateral]
      a = tmp[:larger_basis]
      b = tmp[:smaller_basis]
      ((a + b) / 2) * (Math.sqrt((c * c) - ((a - b) * (a - b) / 4)))
    else
      puts "Trapezium is not equilateral"
    end

  end

  def perimeter
    sides[:left_lateral] + sides[:smaller_basis] + sides[:right_lateral] + sides[:smaller_basis]
  end

  def info

  end
end

trapezium = Trapezium.new

trapezium.replace_points(trapezium.right_horizontal_order)
print trapezium.sides
print trapezium.equilateral?
print trapezium.perimeter

