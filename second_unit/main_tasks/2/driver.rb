require_relative 'worker'
class Driver < Worker
  private attr_accessor :driving_experience, :driving_category
  # private :driving_experience, :driving_category

  public
  def initialize(name, age, salary, driving_experience, driving_category)
    @name = name
    @age = age
    @salary = salary
    @driving_experience = driving_experience
    if %w[A B C a b c].include?(driving_category) # driving_category correctness check
      @driving_category = driving_category
    else
      puts "Getting wrong category format.."
    end
  end

  def driving_category
    @driving_category
  end

  def driving_category=(driving_category)
    if %w[A B C a b c].include?(driving_category)
      @driving_category = driving_category
      puts 'Driving category has changed'
    else
      puts "Getting wrong category format.."
    end
  end
end

driver = Driver.new("Oleh", 19, 4000, 1, 'A')
puts "Driving category: " + driver.driving_category
driver.driving_category = 'D' # first try to change category of this driver
puts "Driving category: " + driver.driving_category
driver.driving_category = 'C' # first try to change category of this driver
puts "Driving category: " + driver.driving_category
