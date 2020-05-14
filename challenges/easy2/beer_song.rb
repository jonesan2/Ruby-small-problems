class BeerSong
  def initialize; end

  def verse(num)
    "#{bottles(num).capitalize} of beer on the wall, " \
    "#{bottles(num)} of beer.\n" \
    "#{bridge(num)}, #{bottles((num - 1) % 100)} of beer on the wall.\n"
  end

  def verses(start, finish)
    lines = start.downto(finish).each.with_object([]) do |num, verse_arr|
      verse_arr << verse(num)
    end
    lines.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  private

  def bottles(num)
    bottles_text = { -1 => "no more bottles",
                     0 => "1 bottle",
                     1 => "#{num} bottles" }
    bottles_text[num <=> 1]
  end

  def bridge(num)
    bridge_text = { 1 => "Take one down and pass it around",
                    0 => "Take it down and pass it around",
                    -1 => "Go to the store and buy some more" }
    bridge_text[num <=> 1]
  end
end
