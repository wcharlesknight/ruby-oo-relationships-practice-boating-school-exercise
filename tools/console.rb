require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

tom = Student.new("tom")
jerry = Student.new("jerry")
arnold = Student.new("arnold")

georgia = Instructor.new("georgia")
henry = Instructor.new("henry")
jim = Instructor.new("jim")

arnold.add_boating_test("test1", "passed", georgia)
arnold.add_boating_test("test3", "passed", jim)
arnold.add_boating_test("test2", "failed", jim)

jerry.add_boating_test("test1", "passed", georgia)
jerry.add_boating_test("test3", "failed", henry)
jerry.add_boating_test("test2", "failed", jim)

tom.add_boating_test("test1", "failed", georgia)
tom.add_boating_test("test3", "failed", henry)
tom.add_boating_test("test2", "failed", georgia)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line

