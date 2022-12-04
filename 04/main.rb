require 'minitest/autorun'

class Test < Minitest::Test
  def test_part1
    path = File.join(File.dirname(__FILE__), 'test.txt')
    input = File.read(path)
    assert part1(input) == 2
  end

  def test_part2
    path = File.join(File.dirname(__FILE__), 'test.txt')
    input = File.read(path)
    assert part2(input) == 4
  end
end

def part1(input)
  elves_pairs = input.split("\n")
  elves_pairs.map do |elves_pair|
    assignments = sorted_assignments(elves_pair.split(","))
    assignments[1].cover?(assignments[0])
  end.count(true)
end

def part2(input)
  elves_pairs = input.split("\n")
  elves_pairs.map do |elves_pair|
    assignments = to_range_array(elves_pair.split(","))
    (assignments[1] & (assignments[0])).empty?
  end.count(false)
end

def to_range_array(assignments)
  [to_range(assignments[0].split("-")).to_a, to_range(assignments[1].split("-")).to_a]
end

def sorted_assignments(assignments)
  [to_range(assignments[0].split("-")), to_range(assignments[1].split("-"))].sort_by {|a| a.size }
end

def to_range(assigment)
  (assigment[0].to_i..assigment[1].to_i)
end

puts part1(File.read(File.join(File.dirname(__FILE__), 'input.txt')))
puts part2(File.read(File.join(File.dirname(__FILE__), 'input.txt')))
