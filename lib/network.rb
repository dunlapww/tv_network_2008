class Network
  attr_reader :name, :shows

  def initialize(name, shows = [])
    @name = name
    @shows = shows
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    #require "pry"; binding.pry
    main_chars = []
    @shows.each do |show|
      show.characters.each do |char|
        main_chars << char
      end
    end
    main_chars
  end

  def actors_by_show

    show_actors = Hash.new()
    @shows.each do |show|
      show.characters.each do |char|
        if show_actors[show].nil?
          show_actors[show] = [char.actor]
        else
          show_actors[show] << char.actor
        end
      end
    end
    show_actors
  end
end
