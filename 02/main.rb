require 'minitest/autorun'

class Test < Minitest::Test
  def test_p2_total_points
    path = File.join(File.dirname(__FILE__), 'test.txt')
    input = File.read(path)
    assert p2_total_points(input) == 15
  end

  def test_p2_total_points_with_new_rule
    path = File.join(File.dirname(__FILE__), 'test.txt')
    input = File.read(path)
    assert p2_total_points_with_new_rule(input) == 12
  end
end

### PART 1

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

### PART 2

def p2_total_points_with_new_rule(input)
  p1_weapons = ["A", "B", "C"]
  p2_weapons = ["X", "Y", "Z"]

  p2_score = 0
  input.split("\n").each do |round|
    weapons = round.split(" ")
    p1_weapon = p1_weapons.index(weapons[0]) + 1
    p2_weapon = p2_weapons.index(weapons[1]) + 1
    p2_score += fight_result_with_new_rule(p1_weapon, p2_weapon)
  end
  p2_score
end

def fight_result_with_new_rule(p1_weapon, p2_weapon)
  weapons_advantages = { 1 => 3, 2 => 1, 3 => 2 }

  case p2_weapon
  when 1
    weapons_advantages[p1_weapon]
  when 3
    weapons_advantages.invert[p1_weapon] + 6
  else
    p1_weapon + 3
  end
end

puts p2_total_points_with_new_rule(File.read(File.join(File.dirname(__FILE__), 'input.txt')))
