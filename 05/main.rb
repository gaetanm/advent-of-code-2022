require 'minitest/autorun'
require 'pp'

class Test < Minitest::Test
  def input
    File.read(File.join(File.dirname(__FILE__), 'test.txt'))
  end

  def test_part1
    assert part1(input) == "CMZ"
  end
end

def part1(input)
  lines = input.split("\n")
  instructions = instructions(lines)
  stacks = stacks(lines)
  instructions.each { |instruction| apply_instructions(instruction, stacks) }
  stacks.map(&:first).join('')
end

def apply_instructions(instruction, stacks)
  from = instruction[1] - 1
  to = instruction[2] - 1
  crates_to_take = stacks[from][0, instruction[0]]
  
  stacks[to].unshift(crates_to_take.reverse).flatten!
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

puts part1(File.read(File.join(File.dirname(__FILE__), 'input.txt')))
