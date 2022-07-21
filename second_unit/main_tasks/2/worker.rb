require_relative 'user'
class Worker < User
  private attr_accessor :salary
  # private :salary

  public
  def initialize(name, age, salary)
    @name = name
    @age = age
    @salary = salary
  end

  def getSalary
    @salary
  end

  def setSalary(salary)
    @salary = salary
  end
end

worker1 = Worker.new('Іван', 25, 1000)
worker2 = Worker.new('Вася', 26, 2000)
puts "Total salary: " + (worker1.getSalary + worker2.getSalary).to_s