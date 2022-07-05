require 'open-uri'

Category.destroy_all
Bill.destroy_all
Dish.destroy_all
TabDish.destroy_all
Tab.destroy_all
Restaurant.destroy_all
User.destroy_all

user1 = User.create(email: 'carlos.miguel@gmail.com', password: '121212')
puts "User created successfully"

el_taco = Restaurant.create(name: 'El Taco Mexican & Cocktails Bar', address: 'Rua do Diaro de Noticias 23, Lisbon, Portugal', user: user1)
puts "#{el_taco.name} restaurant created successfully"

# Categories
categories = ["Breakfast Meals", "Breakfast Items", "Drinks"]

categories.each_with_index do |category, index|
  Category.create(name: category, order: index)

  puts "#{category} category created successfully"
end

breakfast_meals_category = Category.find_by(name: "Breakfast Meals")
breakfast_items_category = Category.find_by(name: "Breakfast Items")
drinks_category = Category.find_by(name: "Drinks")

# Dishes

dishes = [
  {
    name: 'Chick-fil-A® Chicken Biscuit Meal',
    description: 'A breakfast portion of our famous boneless breast of chicken, seasoned to perfection, hand-breaded, pressure cooked in 100% refined peanut oil and served on a buttermilk biscuit baked fresh at each Restaurant.',
    price_cents: 789,
    category: breakfast_meals_category
  },
  {
    name: 'Chick-fil-A Chick-n-Minis™ 4 Ct Meal',
    description: 'Bite-sized Chick-fil-A® Nuggets nestled in warm, mini yeast rolls that are lightly brushed with a honey butter spread.',
    price_cents: 919,
    category: breakfast_meals_category
  },
  {
    name: 'Hash Brown Scramble Burrito Meal',
    description: 'A hearty morning meal of sliced grilled chicken, crispy Hash Browns, scrambled eggs and a blend of Monterey Jack and Cheddar cheeses. Made fresh each morning. Rolled in a warm flour tortilla. Served with Jalapeño Salsa.',
    price_cents: 959,
    category: breakfast_meals_category
  },
  {
    name: 'Hash Brown Scramble Bowl Meal',
    description: 'A hearty morning meal of sliced Chick-fil-A Nuggets, crispy Hash Browns, scrambled eggs and a blend of Monterey Jack and Cheddar cheeses. Made fresh each morning. Served in a convenient bowl. Served with Jalapeño Salsa.',
    price_cents: 959,
    category: breakfast_meals_category
  },
  {
    name: 'Chicken, Egg & Cheese Biscuit Meal',
    description: 'A breakfast portion of our famous boneless breast of chicken, seasoned to perfection, freshly breaded, pressure cooked in 100% refined peanut oil, a folded egg and cheese, served on a buttermilk biscuit baked fresh at each Restaurant.',
    price_cents: 909,
    category: breakfast_meals_category
  },
  {
    name: 'Bacon, Egg, & Cheese Biscuit Meal',
    description: 'Delicious strips of smoked applewood bacon along with folded egg and cheese served on a freshly baked buttermilk biscuit.',
    price_cents: 849,
    category: breakfast_meals_category
  },
  {
    name: 'Sausage, Egg, & Cheese Biscuit Meal',
    description: 'A tasty pork sausage patty along with a folded egg and cheese served on a freshly baked buttermilk biscuit.',
    price_cents: 849,
    category: breakfast_meals_category
  },
  {
    name: 'Chicken, Egg, & Cheese Muffin Meal',
    description: 'A breakfast portion of our famous boneless breast of chicken, with folded egg and American cheese, served on a toasted multigrain English Muffin.',
    price_cents: 935,
    category: breakfast_meals_category
  },
  {
    name: 'Bacon, Egg, & Cheese Muffin Meal',
    description: 'Delicious strips of smoked applewood bacon, folded egg and American cheese served on a toasted multigrain English muffin.',
    price_cents: 869,
    category: breakfast_meals_category
  },
  {
    name: 'Sausage, Egg, & Cheese Muffin Meal',
    description: 'Savory pork sausage, freshly prepared eggs and American cheese served on a toasted multigrain English muffin.',
    price_cents: 869,
    category: breakfast_meals_category
  },
  {
    name: 'Chick-fil-A® Chicken Biscuit',
    description: 'A breakfast portion of our famous boneless breast of chicken, seasoned to perfection, hand-breaded, pressure cooked in 100% refined peanut oil and served on a buttermilk biscuit baked fresh at each Restaurant.',
    price_cents: 224,
    category: breakfast_items_category
  },
  {
    name: 'Chick-fil-A Chick-n-Minis™',
    description: 'Bite-sized Chick-fil-A® Nuggets nestled in warm, mini yeast rolls that are lightly brushed with a honey butter spread.',
    price_cents: 529,
    category: breakfast_items_category
  },
  {
    name: 'Egg White Grill',
    description: 'A breakfast portion of grilled chicken with a hint of citrus, served on a toasted multigrain English muffin with egg whites and American cheese.',
    price_cents: 386,
    category: breakfast_items_category
  },
  {
    name: 'Hash Brown Scramble Burrito',
    description: 'A hearty morning meal of sliced Chick-fil-A Nuggets, crispy Hash Browns, scrambled eggs and a blend of Monterey Jack and Cheddar cheeses. Made fresh each morning. Rolled in a warm flour tortilla. Served with Jalapeño Salsa.',
    price_cents: 569,
    category: breakfast_items_category
  },
  {
    name: 'Hash Brown Scramble Bowl',
    description: 'A hearty morning meal of sliced Chick-fil-A Nuggets, crispy Hash Browns, scrambled eggs and a blend of Monterey Jack and Cheddar cheeses. Made fresh each morning. Served in a convenient bowl. Served with Jalapeño Salsa.',
    price_cents: 569,
    category: breakfast_items_category
  },
  {
    name: 'Chicken, Egg & Cheese Biscuit',
    description: 'A breakfast portion of our famous boneless breast of chicken, seasoned to perfection, freshly breaded, pressure cooked in 100% refined peanut oil, a folded egg and cheese, served on a buttermilk biscuit baked fresh at each Restaurant.',
    price_cents: 519,
    category: breakfast_items_category
  },
  {
    name: 'Bacon, Egg & Cheese Biscuit',
    description: 'Delicious strips of smoked applewood bacon along with folded egg and cheese served on a freshly baked buttermilk biscuit.',
    price_cents: 455,
    category: breakfast_items_category
  },
  {
    name: 'Sausage, Egg & Cheese Biscuit',
    description: 'A tasty pork sausage patty along with a folded egg and cheese served on a freshly baked buttermilk biscuit.',
    price_cents: 455,
    category: breakfast_items_category
  },
  {
    name: 'Chicken, Egg, & Cheese Muffin',
    description: 'A breakfast portion of our famous boneless breast of chicken, with folded egg and American cheese, served on a toasted multigrain English Muffin.',
    price_cents: 545,
    category: breakfast_items_category
  },
  {
    name: 'Bacon, Egg & Cheese Muffin',
    description: 'Delicious strips of smoked applewood bacon, folded egg and American cheese served on a toasted multigrain English muffin.',
    price_cents: 479,
    category: breakfast_items_category
  },
  {
    name: 'Sausage, Egg & Cheese Muffin',
    description: 'Savory pork sausage, freshly prepared eggs and American cheese served on a toasted multigrain English muffin.',
    price_cents: 479,
    category: breakfast_items_category
  },
  {
    name: 'Buttered Biscuit',
    description: 'A delicious buttermilk biscuit baked fresh at each Restaurant. Served lightly buttered or plain.',
    price_cents: 175,
    category: breakfast_items_category
  },
  {
    name: 'English Muffin',
    description: 'Toasted multigrain English muffin.',
    price_cents: 199,
    category: breakfast_items_category
  },
  {
    name: 'Hash Browns',
    description: 'Crispy potato medallions cooked in canola oil.',
    price_cents: 179,
    category: breakfast_items_category
  },
  {
    name: 'Greek Yogurt Parfait',
    description: 'Creamy, organic vanilla bean Greek yogurt with fresh berries and your choice of toppings.',
    price_cents: 559,
    category: breakfast_items_category
  },
  {
    name: 'Fruit Cup',
    description: 'A nutritious fruit mix made with chopped pieces of red and green apples, mandarin orange segments, fresh strawberry slices, and blueberries, served chilled. Prepared fresh daily.',
    price_cents: 475,
    category: breakfast_items_category
  },
  {
    name: 'Chick-fil-A® Lemonade',
    description: 'Classic lemonade using three simple ingredients: real lemon juice—not from concentrate, cane sugar, and water.',
    price_cents: 299,
    category: drinks_category
  },
  {
    name: 'Freshly-Brewed Iced Tea Sweetened',
    description: 'Freshly-brewed each day from a blend of tea leaves. Available sweetened with real cane sugar.',
    price_cents: 300,
    category: drinks_category
  },
  {
    name: 'Freshly-Brewed Iced Tea Unsweetened',
    description: ' Freshly-brewed each day from a blend of tea leaves. Available unsweetened.',
    price_cents: 245,
    category: drinks_category
  },
  {
    name: 'Chick-fil-A® Diet Lemonade',
    description: 'Classic lemonade using three simple ingredients: real lemon juice—not from concentrate, Splenda® No Calorie Sweetener, and water.',
    price_cents: 299,
    category: drinks_category
  },
  {
    name: '1/2 Sweet Tea 1/2 Unsweet Tea',
    description: 'Freshly-brewed each day from a blend of tea leaves. Available sweetened with real cane sugar.',
    price_cents: 245,
    category: drinks_category
  },
  {
    name: 'Iced Coffee',
    description: 'Handcrafted daily, made with a custom blend of cold-brewed coffee and 2% milk, sweetened with pure cane sugar and served over ice. Our coffee beans are sourced by THRIVE Farmers, a farmer-direct coffee company that enriches the lives and communities of those who grow it. Available all day in Original or Vanilla.',
    price_cents: 389,
    category: drinks_category
  },
  {
    name: 'Dr Pepper®',
    description: 'Fountain beverage. Product of Keurig Dr Pepper, Inc.',
    price_cents: 245,
    category: drinks_category
  },
  {
    name: 'Diet Dr Pepper®',
    description: 'Fountain beverage. Product of Keurig Dr Pepper, Inc.',
    price_cents: 245,
    category: drinks_category
  },
  {
    name: 'Coca-Cola®',
    description: 'Fountain beverage. A product of The Coca-Cola Company.',
    price_cents: 245,
    category: drinks_category
  },
  {
    name: 'Diet Coke®',
    description: 'Fountain beverage. A product of The Coca-Cola Company.',
    price_cents: 245,
    category: drinks_category
  },
  {
    name: 'Coke® Zero Sugar',
    description: 'Fountain beverage. A product of The Coca-Cola Company.',
    price_cents: 245,
    category: drinks_category
  },
  {
    name: 'Coca-Cola® Cherry',
    description: 'Fountain beverage. A product of The Coca-Cola Company.',
    price_cents: 245,
    category: drinks_category
  },
  {
    name: 'Sprite®',
    description: 'Fountain beverage. A product of The Coca-Cola Company.',
    price_cents: 245,
    category: drinks_category
  },
  {
    name: 'Barq\'s® Root Beer',
    description: 'Fountain beverage. A product of The Coca-Cola Company.',
    price_cents: 245,
    category: drinks_category
  },
  {
    name: 'Hi-C® Fruit Punch',
    description: 'Fountain beverage. A product of The Coca-Cola Company.',
    price_cents: 245,
    category: drinks_category
  },
  {
    name: 'POWERADE®',
    description: 'Fountain beverage. A product of The Coca-Cola Company.',
    price_cents: 245,
    category: drinks_category
  },
  {
    name: 'DASANI® Bottled Water',
    description: 'Purified water that is carefully designed and enhanced with minerals for a pure, fresh taste. DASANI® is a registered trademark of The Coca-Cola® Company.',
    price_cents: 259,
    category: drinks_category
  },
  {
    name: 'Honest Kids® Apple Juice',
    description: 'Honest Kids® Apple Juice (juice box with straw).',
    price_cents: 215,
    category: drinks_category
  },
  {
    name: 'Simply Orange®',
    description: '100% pure-squeezed, pasteurized Orange Juice.',
    price_cents: 359,
    category: drinks_category
  },
  {
    name: '1% Chocolate Milk',
    description: '',
    price_cents: 215,
    category: drinks_category
  },
  {
    name: '1% Milk',
    description: '1% Cows milk',
    price_cents: 215,
    category: drinks_category
  },
  {
    name: 'Gallon Beverages',
    description: 'Gallon beverage filled with your choice of tea or lemonade',
    price_cents: 1559,
    category: drinks_category
  },
]

dishes.each do |dish|
  Dish.create!(
    name: dish[:name],
    description: dish[:description],
    price_cents: dish[:price_cents],
    category_id: dish[:category].id,
    restaurant: el_taco
  )

  puts "#{dish[:name]} - dish created successfully"
end

7.times do |n|
  Tab.create!(
    total_cents: 0,
    status: [:open, :closed].sample,
    table_number: n + 1,
    restaurant: el_taco
  )

  puts "Tab #{n + 1} created successfully"
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?