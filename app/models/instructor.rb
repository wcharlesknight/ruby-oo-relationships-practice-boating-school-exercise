class Instructor
    attr_reader :name

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def boating_tests
       BoatingTest.all.select {|tests| tests.instructor == self} #returns all the instructors boating tests
    end

    def passed_students
        passed_tests = self.boating_tests.select {|tests| tests.status == "passed"}
        passed_tests.map {|tests| tests.student.first_name }
    end
    
    def pass_student(student, test_name)
       BoatingTest.all.each do |tests| 
        if tests.student == student && tests.test_name == test_name
            tests.status = "passed"
        else 
            return BoatingTest.new(student, test_name, "passed", self)
        end
       end  
    end
    
    def fail_student(student, test_name)
        BoatingTest.all.each do |tests| 
         if tests.student == student && tests.test_name == test_name
             tests.status = "failed"
         else 
             return BoatingTest.new(student, test_name, "failed", self)
         end
        end  
     end
     
    def all_students
        self.boating_tests.map {|tests| tests.student}.uniq
    end 


end
