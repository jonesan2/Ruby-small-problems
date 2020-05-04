def rot13(text)
  letters = ('a'..'z').to_a + ('A'..'Z').to_a
  output = text.chars.map do |char|
    idx = letters.find_index(char)
    if idx.nil? then char
    elsif idx < 26 then letters[(idx + 13) % 26]
    else letters[(idx - 13) % 26 + 26]
    end
  end
  puts output.join
end

names = <<-NAMES 
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
NAMES

rot13(names)