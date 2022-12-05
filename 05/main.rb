require 'minitest/autorun'
require 'pp'

class Test < Minitest::Test
  def input
    File.read(File.join(File.dirname(__FILE__), 'test.txt'))
  end

  def test_part1
    assert day5(input, :part1) == "CMZ"
  end

  def test_part2
    assert day5(input, :part2) == "MCD"
  end
end

def day5(input, part)
  lines = input.split("\n")
  stacks = stacks(lines)
  instructions(lines).each { |instruction| apply_instructions(instruction, stacks, part) }
  stacks.map(&:first).join('')
end

def apply_instructions(instruction, stacks, part)
  from = instruction[1] - 1
  to = instruction[2] - 1
  crates_to_take = stacks[from][0, instruction[0]]
  crates_to_take.reverse! if part == :part1
  
  stacks[to].unshift(crates_to_take).flatten!
  stacks[from].shift(instruction[0])
end

def stacks(lines)
  stacks = Array.new(array_size(lines)) { Array.new }
  lines.each do |line|
    if line.include? "]"
      i = 1; j = 0
      until i > line.size do
        stacks[j].push(line[i]) if line[i] != " "
        i += 4; j += 1
      end
    end
  end
  stacks
end

def instructions(lines)
  instructions = []
  lines.each do |line| 
    if line.include? "m"
      split_line = line.split(" ")
      instructions.push([split_line[1], split_line[3], split_line[5]].map(&:to_i))
    end
  end
  instructions
end

def array_size(lines)
  lines.each { |line| return (line[-2].to_i) if line[1] == "1" }
end

puts day5(File.read(File.join(File.dirname(__FILE__), 'input.txt')), :part1)
puts day5(File.read(File.join(File.dirname(__FILE__), 'input.txt')), :part2)
