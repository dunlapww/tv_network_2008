require 'minitest/autorun'
require './lib/character'
require './lib/show'
require './lib/network'

class NetworkTest < Minitest::Test

  def test_it_exists
    nbc = Network.new("NBC")
    assert_instance_of Network, nbc
  end

  def test_it_has_a_name_and_shows
    nbc = Network.new("NBC")
    assert_equal "NBC", nbc.name
    assert_equal [], nbc.shows
  end

  def test_it_can_add_shows
    kitt_dtl ={name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(kitt_dtl)

    mknight_dtl = {name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000}
    michael_knight = Character.new(mknight_dtl)

    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    knope_dtl = {name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000}
    leslie_knope = Character.new(knope_dtl)

    swanson_dtl = {name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000}
    ron_swanson = Character.new(swanson_dtl)

    pr_name = "Parks and Recreation"
    pr_creator = "Michael Shur & Greg Daniels"
    pr_actors = [leslie_knope, ron_swanson]
    parks_and_rec = Show.new(pr_name, pr_creator, pr_actors)

    nbc = Network.new("NBC")

    nbc.add_show(knight_rider)
    assert nbc.shows.all? {|show| show.class == Show}
    assert_equal ["Knight Rider"], nbc.shows.map {|show| show.name}

    nbc.add_show(parks_and_rec)
    assert_equal ["Knight Rider", "Parks and Recreation"], nbc.shows.map {|show| show.name}

  end

  def test_it_knows_its_main_characters
    kitt_dtl ={name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(kitt_dtl)

    mknight_dtl = {name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000}
    michael_knight = Character.new(mknight_dtl)

    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    knope_dtl = {name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000}
    leslie_knope = Character.new(knope_dtl)

    swanson_dtl = {name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000}
    ron_swanson = Character.new(swanson_dtl)

    pr_name = "Parks and Recreation"
    pr_creator = "Michael Shur & Greg Daniels"
    pr_actors = [leslie_knope, ron_swanson]
    parks_and_rec = Show.new(pr_name, pr_creator, pr_actors)

    nbc = Network.new("NBC")
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

    assert nbc.main_characters.all? {|char| char.class == Character}
    assert ["Michael Knight", "KITT", "Leslie Knope", "Ron Swanson"],
    nbc.main_characters.map {|char| char.name}

  end

  def test_it_knows_actors_by_show
    kitt_dtl ={name: "KITT", actor: "William Daniels", salary: 1_000_000}
    kitt = Character.new(kitt_dtl)

    mknight_dtl = {name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000}
    michael_knight = Character.new(mknight_dtl)

    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    knope_dtl = {name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000}
    leslie_knope = Character.new(knope_dtl)

    swanson_dtl = {name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000}
    ron_swanson = Character.new(swanson_dtl)

    pr_name = "Parks and Recreation"
    pr_creator = "Michael Shur & Greg Daniels"
    pr_actors = [leslie_knope, ron_swanson]
    parks_and_rec = Show.new(pr_name, pr_creator, pr_actors)

    nbc = Network.new("NBC")
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

    assert nbc.actors_by_show.keys.all? {|show| show.class == Show}
  end


end
