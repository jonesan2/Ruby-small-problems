# You cannot use self to call a private method,
# UNLESS it is a setter method. Then you MUST use self.

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end
  
  def show_off_switch
    puts switch
  end

  private
  
  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end