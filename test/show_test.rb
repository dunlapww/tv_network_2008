require 'minitest/autorun'
require './lib/character'
require './lib/show'

class ShowTest < Minitest::Test

  def test_it_exists
    show = Show.new("Knight Rider", "Glen Larson", [])
    assert_instance_of Show, show
  end

  def test_it_knows_show_details
    kitt_dtl ={name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(kitt_dtl)

    mknight_dtl = {name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000}
    michael_knight = Character.new(mknight_dtl)

    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    assert_equal "Knight Rider", knight_rider.name
    assert_equal "Glen Larson", knight_rider.creator

    assert knight_rider.characters.all?{|char| char.class == Character}
    assert_equal ["Michael Knight", "KITT"],
    knight_rider.characters.map {|char| char.name}
  end

  def test_it_knows_total_salary
    kitt_dtl ={name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(kitt_dtl)

    mknight_dtl = {name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000}
    michael_knight = Character.new(mknight_dtl)

    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    assert_equal 2_600_000, knight_rider.total_salary
  end

  def test_it_knows_highest_paid_actor
    kitt_dtl ={name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(kitt_dtl)

    mknight_dtl = {name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000}
    michael_knight = Character.new(mknight_dtl)

    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    assert_equal "David Hasselhoff", knight_rider.highest_paid_actor
  end

  def test_it_knows_actors
    kitt_dtl ={name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(kitt_dtl)

    mknight_dtl = {name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000}
    michael_knight = Character.new(mknight_dtl)

    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    assert_equal ["David Hasselhoff", "William Daniels"], knight_rider.actors
  end

end
