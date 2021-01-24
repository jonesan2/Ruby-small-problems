# ROT13 is a simple letter substitution cipher that replaces a letter 
# with the letter 13 letters after it in the alphabet. ROT13 is an example of 
# the Caesar cipher.
# 
# Create a function that takes a string and returns the string ciphered with 
# Rot13. If there are numbers or special characters included in the string, 
# they should be returned as they are. Only letters from the latin/english 
# alphabet should be shifted, like in the original Rot13 "implementation".
#
# The string that is returned should include only lowercase letters, 
# regardless of the case of the input string.

p rot13('implementation') == 'vzcyrzragngvba'
p rot13('Launch School') == 'ynhapu fpubby'
p rot13("Let's fly a kite!") == "Yrg'f syl n xvgr!"