require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative "view"
require_relative "recipe"
require_relative "cookbook"
require_relative "scraper"
set :bind, "0.0.0.0"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get "/" do
  @recipes = Cookbook.new("recipes.csv").all
  erb :index
end

get "/about" do
  @recipes = Cookbook.new("recipes.csv").all
  erb :about
end

get "/new" do
  @recipes = Cookbook.new("recipes.csv").all
  erb :new
end

post "/new_recipe" do
  cookbook = Cookbook.new("recipes.csv")
  recipe = Recipe.new(params[:name], params[:description], "#{params[:rating]}/5", params[:prep_time])
  cookbook.add_recipe(recipe)
  redirect to "/"
end


get "/team/:username" do
  puts params[:username]
  "The username is #{params[:username]}"
end
