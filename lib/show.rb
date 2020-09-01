class Show
  attr_reader :name, :creator, :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    @characters.reduce(0) {|sum, char| sum += char.salary}
  end

  def highest_paid_actor
    @characters.max_by {|char| char.salary}.actor
  end

  def actors
    @characters.map {|char| char.actor}
  end
end
