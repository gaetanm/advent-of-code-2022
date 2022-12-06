require 'minitest/autorun'

class Test < Minitest::Test
  def input
    File.read(File.join(File.dirname(__FILE__), 'test.txt'))
  end

  def test_part1
    assert day6(input, 4) == 7
  end

  def test_part2
    assert day6(input, 14) == 19
  end
end

def day6(input, nbr_of_distinct_chars)
  chars = input.split("\n")[0].chars
  pos = 0
  till = nbr_of_distinct_chars - 1
  while till < chars.size
    return till + 1 if chars.slice(pos, nbr_of_distinct_chars).uniq.size == nbr_of_distinct_chars
    pos += 1;till += 1
  end
end

puts day6(File.read(File.join(File.dirname(__FILE__), 'input.txt')), 4)
puts day6(File.read(File.join(File.dirname(__FILE__), 'input.txt')), 14)
