require 'minitest/autorun'

class Test < Minitest::Test
  def test_most_calories
    path = File.join(File.dirname(__FILE__), 'test.txt')
    calories = File.read(path)
    assert most_calories(calories) == 24000
  end

  def test_total_three_most_calories
    path = File.join(File.dirname(__FILE__), 'test.txt')
    calories = File.read(path)
    assert total_three_most_calories(calories) == 45000
  end
end

def most_calories(input)
  input.split("\n\n").map { |calories| calories.split("\n").map(&:to_i).sum }.max
end

def total_three_most_calories(input)
  input.split("\n\n").map { |calories| calories.split("\n").map(&:to_i).sum }.max(3).sum
end

puts most_calories(File.read(File.join(File.dirname(__FILE__), 'input.txt')))
puts total_three_most_calories(File.read(File.join(File.dirname(__FILE__), 'input.txt')))
