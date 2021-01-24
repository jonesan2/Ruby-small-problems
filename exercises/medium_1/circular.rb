# Create a circular queue
#
# Data structures:
# --Array1: the queue
# --Integer: A marker that indicates the next insertion index
# --Integer: A marker that indicates the current removal index
#
# Rules:
# --Only the earliest inserted object can be removed
# --New objects can only be inserted in the position to the right
# ----of the most recently inserted object
# --Old objects can be overwritten when a new object is inserted
# --The stored value will never be 'nil', so 'nil' always means
# ----you have an empty position.

class CircularQueue
  def initialize(buffer_size)
    @data = Array.new(buffer_size, nil)
    @insert_index = 0
    @remove_index = 0
  end
  
  def enqueue(elem)
    if @data[@insert_index] != nil
      @remove_index = increment_index(@remove_index) 
    end
    @data[@insert_index] = elem
    @insert_index = increment_index(@insert_index)
  end
  
  def dequeue
    removed_data = @data[@remove_index]
    return nil unless removed_data != nil
    @data[@remove_index] = nil
    @remove_index = increment_index(@remove_index)
    removed_data
  end
  
  private
  
  def increment_index(idx)
    (idx + 1) % @data.size
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil