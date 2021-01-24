# Ways to make this simpler:
# Array#uniq
# Array#count with an array for block data ['BO', 'XK', ...]

BLOCK_HASH = { B: 1, O: 1, X: 2, K: 2, D: 3, Q: 3, C: 4, P: 4, N: 5, A: 5,
               G: 6, T: 6, R: 7, E: 7, F: 8, S: 8, J: 9, W: 9, H: 10, U: 10,
               V: 11, I: 11, L: 12, Y: 12, Z: 0, M: 0 }.freeze

def block_word?(word)
  unused_blocks = Array.new(13, true)
  word.upcase.chars.none? do |chr|
    idx = BLOCK_HASH[chr.to_sym]
    unused_blocks[idx] ? unused_blocks[idx] = false : true
  end
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('otveykqfzpjnu')
p block_word?('abcdefgn')
