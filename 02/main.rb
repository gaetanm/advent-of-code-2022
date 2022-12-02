require 'minitest/autorun'

class Test < Minitest::Test
  def test_most_calories
    path = File.join(File.dirname(__FILE__), 'test.txt')
    input = File.read(path)
    assert p2_total_points(input) == 15
  end
end

def p2_total_points(input)
  p1_weapons = ["A", "B", "C"]
  p2_weapons = ["X", "Y", "Z"]

  p2_score = 0
  input.split("\n").each do |round|
    weapons = round.split(" ")
    p1_weapon = p1_weapons.index(weapons[0]) + 1
    p2_weapon = p2_weapons.index(weapons[1]) + 1
    p2_score += p2_weapon + fight_result(p2_weapon, p1_weapon)
  end
  p2_score
end

def fight_result(p1_weapon, p2_weapon)
  return 3 if p1_weapon == p2_weapon

  weapons_advantages = { 1 => 3, 2 => 1, 3 => 2 }
  weapons_advantages[p1_weapon] == p2_weapon ? 6 : 0
end

puts p2_total_points(File.read(File.join(File.dirname(__FILE__), 'input.txt')))
