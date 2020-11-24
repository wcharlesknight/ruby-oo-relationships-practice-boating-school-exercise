class Student
    
    attr_reader :first_name

    @@all = []
    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end 

    def self.all
        @@all
    end 

    def add_boating_test(test_name, status, instructor)
        BoatingTest.new(self, test_name, status, instructor)
    end
    
    def boating_tests
        BoatingTest.all.select {|tests| tests.student == self} #returns the students boating tests
    end

    def all_instructors
        self.boating_tests.map {|tests| tests.instructor}.uniq #returns the students instructors
    end
    
    def self.find_student(name)
        Student.all.find {|students| students.first_name == name}
    end 

    def grade_percentage
        self.boating_tests.select {|tests| tests.status == "passed"}.count.to_f / self.boating_tests.count.to_f
    end

    
end
