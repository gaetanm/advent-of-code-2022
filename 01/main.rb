require 'minitest/autorun'

class Test < Minitest::Test
  def test_most_calories
    path = File.join(File.dirname(__FILE__), 'test.txt')
    calories = File.read(path)
    assert most_calories(calories) == 24000
  end
end

def most_calories(input)
  input.split("\n\n").map { |calories| calories.split("\n").map(&:to_i).sum }.max
end

puts most_calories(File.read(File.join(File.dirname(__FILE__), 'input.txt')))
