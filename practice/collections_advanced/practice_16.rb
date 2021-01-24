# Better to name methods with an imperative rather than a title
#   e.g. 'generate_UUID' rather than 'uuid_generator'
#
# To generate a UUID that meets protocol, you must follow the standard
# found at https://tools.ietf.org/html/rfc4122
# The method used here has a surprisingly high likelihood of generating
# non-unique identifiers.

HEX_CHARS = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
CHUNK_LENGTHS = [8, 4, 4, 4, 12]

def uuid_generator
  uuid = ''
  CHUNK_LENGTHS.each_with_index do |chunk, index| 
    chunk.times { |_| uuid << HEX_CHARS.sample }
    uuid << '-' unless index >= CHUNK_LENGTHS.size - 1
  end
  uuid
end

p uuid_generator
