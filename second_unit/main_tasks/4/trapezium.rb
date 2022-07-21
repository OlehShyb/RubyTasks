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
    slope_bc = (@c.y - @b.y) / (@c.x - @b.x)
    slope_ad = (@d.y - @a.y) / (@d.x - @a.x)
    slope_bc == slope_ad
  end

  def equilateral?
    sides[:left_lateral] == sides[:right_lateral]
  end

  def area
    if parallel_bases?
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
  end

  def perimeter
    sides[:left_lateral] + sides[:smaller_basis] + sides[:right_lateral] + sides[:larger_basis]
  end

  def info
    puts "Info about trapezium:"
    if parallel_bases?
      if equilateral?
        puts "It's equilateral."
      else
        puts "It's not equilateral."
      end
      puts "All sides:"
      sides.each do |side_name, length|
        case side_name
        when :left_lateral
          puts "Left lateral length = " + length.to_s
        when :right_lateral
          puts "Right lateral length = " + length.to_s
        when :smaller_basis
          puts "Smaller basis length = " + length.to_s
        when :larger_basis
          puts "Larger basis length = " + length.to_s
        end
      end
      puts "Perimeter = " + perimeter.to_s
      puts "Area = " + area.to_s
    else
      puts "It's not a trapezium:( Try again.."
    end
  end
end

trapezium = Trapezium.new
print trapezium.parallel_bases?
trapezium.replace_points(trapezium.right_horizontal_order)
trapezium.info

