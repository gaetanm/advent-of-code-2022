require 'minitest/autorun'

class Test < Minitest::Test
  def test_total_priority
    path = File.join(File.dirname(__FILE__), 'test.txt')
    input = File.read(path)
    assert total_priority(input) == 157
  end

  def test_total_badges
    path = File.join(File.dirname(__FILE__), 'test.txt')
    input = File.read(path)
    assert total_badges(input) == 70
  end
end

def total_priority(input)
  common_elements = input.split("\n").map do |rucksack|
    (rucksack[0..((rucksack.size / 2) - 1)].chars & rucksack[((rucksack.size / 2))..].chars)[0]
  end
  weigh_priority(common_elements)
end

def total_badges(input)
  rucksacks = input.split("\n")
  groups = []
  i = 0
  ((rucksacks.size / 3)).times { groups << rucksacks.slice(i, i += 3) }
  common_elements = groups.map { |group| group[0].chars & group[1].chars & group[2].chars }
  weigh_priority(common_elements.flatten)
end

def weigh_priority(elements)
  elements.map { |element| element.upcase == element ? element.bytes[0] - 38 : element.bytes[0] - 96 }.sum
end

puts total_priority(File.read(File.join(File.dirname(__FILE__), 'input.txt')))
puts total_badges(File.read(File.join(File.dirname(__FILE__), 'input.txt')))
