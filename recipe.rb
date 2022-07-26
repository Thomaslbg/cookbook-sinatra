class Recipe
  attr_accessor :name, :description, :rating, :done, :prep_time

  def initialize(name, description, rating, prep_time)
    @name = name
    @description = description
    @rating = rating
    @prep_time = prep_time
    @done = false
  end

  def done!
    @done = true
  end
end
