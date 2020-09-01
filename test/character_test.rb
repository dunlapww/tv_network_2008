require 'minitest/autorun'
require './lib/character'

class CharacterTest < Minitest::Test

  def test_it_exists
    details = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    character = Character.new(details)
    assert_instance_of Character, character
  end

  def test_it_has_actor_details
    details = {name: "KITT", actor: "William Daniels", salary: 1_000_000}
    character = Character.new(details)

    assert_equal "KITT", character.name
    assert_equal "William Daniels", character.actor
    assert_equal 1_000_000, character.salary
  end

end
