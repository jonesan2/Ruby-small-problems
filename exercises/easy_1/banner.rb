class Banner
  def initialize(message, width = 0)
    @message = message
    @width = width <= 80 ? width : 80
    @minimum_width = message.length + 2
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    @width <= @minimum_width ? "+#{'-' * @minimum_width}+" : "+#{'-' * @width}"
  end

  def empty_line
    @width <= @minimum_width ? "|#{' ' * @minimum_width}|" : "|#{' ' * (@width)}|"
  end

  def message_line
    if @width <= @minimum_width
      "| #{@message} |"
    else
      half_width_gap = ' ' * ((@width - @message.length)/ 2)
      trailer = (@width % 2).zero? ? '|' : ' |'
      "|#{half_width_gap}#{@message}#{half_width_gap}#{trailer}"
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 4)
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 65)
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 99)
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 80)
puts banner