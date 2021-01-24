arr_of_strings = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

def has_lab?(str)
  /lab/.match(str.downcase) ? (puts str) : nil
end

arr_of_strings.each { |x| has_lab?(x) }
