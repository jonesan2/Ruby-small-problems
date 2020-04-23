# You cannot use self to call a private method,
# UNLESS it is a setter method. Then you MUST use self.

class Machine
  def initialize
    @switch = :off
  end
  
  def start
    self.switch = :on
  end

  def stop
    self.switch = :off
  end
  
  def show_switch
    puts switch
  end
  
  def pub_flip
    self.flip_switch
  end
  
  private
  
  attr_reader :switch
  
  def flip_switch
    switch == :on ? (self.switch = :off) : (self.switch = :on)
  end
  
  def switch=(desired_state)
    @switch = desired_state
  end
end

my_switch = Machine.new
my_switch.start
my_switch.show_switch
my_switch.pub_flip
my_switch.show_switch