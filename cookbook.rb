require_relative "recipe"
require 'csv'
require_relative "scraper"

class Cookbook
  attr_accessor :cookbook, :recipes

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    csv_parse
  end

  def csv_parse
    CSV.foreach(@csv_file_path) do |row|
      recipe = Recipe.new(row[0], row[1], row[2], row[3])
      @recipes << recipe
    end
  end

  def csv_write
    CSV.open(@csv_file_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.done, recipe.prep_time]
      end
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    csv_write
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    csv_write
  end
end
