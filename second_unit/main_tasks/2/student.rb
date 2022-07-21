require_relative 'user'
class Student < User
  private attr_accessor :stipend, :course
  # private :stipend, :course
  public

  def initialize(name, age, stipend, course)
    @name = name
    @age = age
    @stipend = stipend
    @course = course
  end

  def getStipend
    @stipend
  end

  def getCourse
    @course
  end

  def setStipend(stipend)
    @stipend = stipend
  end

  def setCourse(course)
    @course = course
  end
end
