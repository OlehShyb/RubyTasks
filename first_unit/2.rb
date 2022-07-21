def say_hello(name = "stranger")
  puts ("hello " + name).upcase
end
print "Enter your name: "
say_hello(gets)
