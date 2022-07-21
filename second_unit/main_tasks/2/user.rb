class User
  protected attr_accessor :name, :age
  # protected :name, :age

  public
  def initialize(name, age)
    @name = name
    @age = age
  end

  def getName
    @name
  end

  def getAge
    @age
  end

  def setName(name)
    @name = name
  end

  def setAge(age)
    @age = age
  end
end



