class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.done ? "[x]": "[ ]"} #{recipe.name} | #{recipe.description} | #{recipe.rating} | #{recipe.prep_time}min 👨‍🍳"
    end
  end

  def ask_for_name
    puts "👨‍🍳 What is the name of the recipe? 👨‍🍳"
    print "> "
    gets.chomp
  end

  def ask_for_description
    puts "👨‍🍳 Describe the recipe 👨‍🍳"
    print "> "
    gets.chomp
  end

  def ask_for_rating
    puts "👨‍🍳 Rating of the recipe? 👨‍🍳"
    print "> "
    gets.chomp
  end

  def ask_for_index
    puts "👨‍🍳 Which recipe? 👨‍🍳"
    print "> "
    gets.chomp.to_i - 1
  end

  def ask_for_prep_time
    puts "👨‍🍳 What is the prep time? 👨‍🍳"
    print "> "
    gets.chomp.to_i - 1
  end

  def ask_for_keyword
    puts "👨‍🍳 What ingredient would you like a recipe for? 👨‍🍳"
    print "> "
    gets.chomp
  end

  def ask_for_index_search
    puts "👨‍🍳 Which recipe would you like to import? (enter index) 👨‍🍳"
    print "> "
    gets.chomp.to_i - 1
  end
end
