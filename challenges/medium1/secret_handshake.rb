class SecretHandshake
  def initialize(num)
    @code = if num.is_a?(Integer)
              num.to_s(2)
            elsif num.is_a?(String)
              num.match(/\A[01]+\z/) ? num : '0'
            else raise ArgumentError, "must pass integer or binary string"
            end
  end

  def commands
    actions = ['jump', 'close your eyes', 'double blink', 'wink']
    shake = []
    -1.downto(-4).each { |idx| shake << actions[idx] if @code[idx] == '1' }
    @code[-5] == '1' ? shake.reverse : shake
  end
end
