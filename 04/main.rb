require 'minitest/autorun'

class Test < Minitest::Test
  def input
    File.read(File.join(File.dirname(__FILE__), 'test.txt'))
  end

  def test_part1
    assert part1(input) == 2
  end

  def test_part2
    assert part2(input) == 4
  end
end

def part1(input)
  input.split("\n").map do |elves_pair|
    assignments = elves_pair.split(",").map { |assignment| to_range(assignment.split("-")) }.sort_by {|a| a.size }
    assignments[1].cover?(assignments[0])
  end.count(true)
end

def part2(input)
  input.split("\n").map do |elves_pair|
    assignments = elves_pair.split(",").map { |assignment| (to_range(assignment.split("-"))).to_a }
    (assignments[1] & (assignments[0])).empty?
  end.count(false)
end

def to_range(assigment)
  (assigment[0].to_i..assigment[1].to_i)
end

puts part1(File.read(File.join(File.dirname(__FILE__), 'input.txt')))
puts part2(File.read(File.join(File.dirname(__FILE__), 'input.txt')))
