require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @title1 = "Buy milk"
    @unused_title = "fhqwhgads"
    
    @todo1 = Todo.new(@title1)
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  
  def test_size
    assert_equal(3, @list.size)
  end
  
  def test_first
    assert_equal(@todo1, @list.first)
  end
  
  def test_last
    assert_equal(@todo3, @list.last)
  end
  
  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done_question
    refute(@list.done?)
    @todo1.done!
    @todo2.done!
    @todo3.done!
    assert(@list.done?)
  end
  
  def test_bad_insert
    assert_raises(TypeError) { @list.add(504) }
    assert_raises(TypeError) { @list.add('wrong type') }
  end
  
  def test_shovel
    @todo4 = Todo.new("Feed the dog")
    @list << @todo4
    @todos << @todo4
    assert_equal(@todos, @list.to_a)
  end
  
  def test_add
    @todo4 = Todo.new("Feed the dog")
    @list.add(@todo4)
    @todos << @todo4
    assert_equal(@todos, @list.to_a)
  end
  
  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_equal(@todo3, @list.item_at(2))
    assert_equal(@todo3, @list.item_at(-1))
    assert_raises(IndexError) { @list.item_at(5) }
    assert_raises(IndexError) { @list.item_at(nil) }
  end
  
  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?) 
  end
  
  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @todo1.done!
    @todo2.done!
    @todo3.done!
    
    @list.mark_undone_at(1)
    @todo3.undone!
    
    assert_equal(true, @todo1.done?) 
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
  
  def test_done_bang
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
    assert_equal(@list, @list.all_done)
  end
  
  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
    assert_equal(@list, @list.all_done)
  end
  
  def test_all_not_done
    assert_equal(@list, @list.all_not_done)
  end
  
  def test_mark_done
    @list.mark_done(@title1)
    assert_equal(true, @todo1.done?)
  end
  
  def test_mark_all_undone
    @list.mark_all_done
    @list.mark_all_undone
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
  
  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    assert_raises(IndexError) { @list.remove_at(nil) }
    assert_equal(@todo2, @list.remove_at(1))
    assert_equal([@todo1, @todo3], @list.to_a)
  end
  
  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result)
  end
  
  def test_each_return
    assert_equal(@list, @list.each { |todo| nil })
  end
  
  def test_select
    @todo2.done!
    new_list = TodoList.new(@list.title)
    new_list << @todo1 << @todo3
    assert_equal(new_list, @list.select { |todo| !todo.done? })
  end
  
  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title(@title1))
    assert_equal(nil, @list.find_by_title(@unused_title))
  end
  
  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_one_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
    
    @todo2.done!
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_all_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    
    @list.done!
    assert_equal(output, @list.to_s)
  end
end