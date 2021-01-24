GRADES = { (90..100) => 'A',
           (80...90) => 'B',
           (70...80) => 'C',
           (60...70) => 'D',
           (0...60) => 'F' }

def get_grade(n1, n2, n3)
  grades = [n1, n2, n3]
  avg = grades.sum / grades.size
  GRADES.each_key { |range| return GRADES[range] if range.include?(avg) } 
end


p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
