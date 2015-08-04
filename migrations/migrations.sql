#CREATE THE DATABASE
CREATE DATABASE aisle_tou;

#CONNECT TO THE DATABASE
\c aisle_tou;

#CREATE ALL THE TABLES
CREATE TABLE users (id SERIAL PRIMARY KEY, email_address varchar(255), passowrd_hash varchar(255), password_salt varchar(255));

CREATE TABLE deliveries (id SERIAL PRIMARY KEY, date date, time_of_day_id int, basket_id int, user_id int);

CREATE TABLE baskets (id SERIAL PRIMARY KEY, total_price decimal, item_count int, user_id int);

CREATE TABLE basket_items (id SERIAL PRIMARY KEY, basket_id int, food_id int, item_count int, scheduled boolean);

CREATE TABLE food (id SERIAL PRIMARY KEY, name varchar(255), price decimal, catergory_id int);

CREATE TABLE food_categories (id SERIAL PRIMARY KEY, name varchar(255));

CREATE TABLE time_of_days (id SERIAL PRIMARY KEY, name varchar(255));


#NEED TO ADD THIS TO GET PRICES FOR EACH FOOD ITEM!
ALTER TABLE food ADD price decimal;

#NEED TO FIX TYPO ON COLUMN NAME!!!
ALTER TABLE users RENAME email_adress TO email_address;

#ADD ALL THE FOOD CATEGORIES
INSERT INTO food_categories (name) VALUES ('Animal-Pet Foods');
INSERT INTO food_categories (name) VALUES ('Bakery Goods');
INSERT INTO food_categories (name) VALUES ('Beverages');
INSERT INTO food_categories (name) VALUES ('Confectionery');
INSERT INTO food_categories (name) VALUES ('Convenience Foods');
INSERT INTO food_categories (name) VALUES ('Dairy Products');
INSERT INTO food_categories (name) VALUES ('Dietetic Foods');
INSERT INTO food_categories (name) VALUES ('Ethnic Foods');
INSERT INTO food_categories (name) VALUES ('Frozen Foods');
INSERT INTO food_categories (name) VALUES ('Fruits');
INSERT INTO food_categories (name) VALUES ('Grocery Products');
INSERT INTO food_categories (name) VALUES ('Health Foods');
INSERT INTO food_categories (name) VALUES ('Ingredients');
INSERT INTO food_categories (name) VALUES ('Meat');
INSERT INTO food_categories (name) VALUES ('Nurseries');
INSERT INTO food_categories (name) VALUES ('Poultry');
INSERT INTO food_categories (name) VALUES ('Seafood');
INSERT INTO food_categories (name) VALUES ('Seeds & Nuts');
INSERT INTO food_categories (name) VALUES ('Snack Foods');
INSERT INTO food_categories (name) VALUES ('Vegetables');

#ADD ALL THE FOODS
INSERT INTO food (name, catergory_id, price) VALUES ('Animal-Pet Foods', 1, 14.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Bird Seed', 1, 14.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Bagels', 2, 3.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Bakery Goods', 2, 3.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Baking: Flour & Mixes', 2, 3.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Biscuits & Biscuit Mixes', 2, 3.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Bread', 2, 3.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Cakes & Cake Mixes', 2, 3.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Dough', 2, 3.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Flour', 2, 3.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Matzos', 2, 3.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Muffins', 2, 3.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Pancake Mixes', 2, 3.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Pies/Tarts', 2, 3.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Alcoholic Beverages', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Beer/Ale/Lager', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Beverages', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Cocktail Mixes', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Cocoa', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Coffee', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Drink Mixes', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Energy Drinks', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fruit Drinks', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Iced Tea', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Isotonic Drinks', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Juices: Citrus', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Juices: Non-citrus', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Lemonade', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Malt Beverages', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Non-Alcoholic Beverages', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Orange Juice', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Soft Drinks', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Tea', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Vegetable Juices', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Water', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Wine/Wine Coolers', 3, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Cheese Cakes', 4, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Chocolate and Chocolate Products', 4, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Coconut Brittle', 4, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Confectionery', 4, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Cookies & Crackers', 4, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Dessert Foods', 4, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Dessert Toppings & Fillings', 4, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Hard Candies', 4, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Marshmallows', 4, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Pastries', 4, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Peanut Brittle', 4, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Sugar', 4, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Convenience Foods', 5, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Butter', 6, 4.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Cheese', 6, 4.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Coffee Creamer', 6, 4.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Dairy Products', 6, 4.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Frozen Yogurt', 6, 4.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Ice Cream & Ice Milk', 6, 4.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Milk', 6, 4.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Yogurt', 6, 4.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Dietetic Foods', 7, 8.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Low Sodium Foods', 7, 8.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Sugar Substitutes', 7, 8.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Cajun Foods', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Chili', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Couscous', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Egg Rolls', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Ethnic Foods', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Gazpacho', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Halal Foods', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Indian Foods', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Islamic Certified Foods', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Italian Foods', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Kosher Foods', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Lebanese Foods', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Mexican Foods', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Oriental Foods', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Tabouli', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Tamales', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Tex-Mex Foods', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Tortillas', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Wontons', 8, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Frozen: Beef', 9, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Frozen: Foods', 9, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Frozen: Frozen Dinners & Entrees', 9, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Frozen: Fruit', 9, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Frozen: Meats', 9, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Frozen: Pork', 9, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Frozen: Poultry', 9, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Frozen: Turkey', 9, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Frozen: Vegetable', 9, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Dried: Fruits', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Apple Products', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Apple Sauce', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Apples', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Apricots', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Avocados', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Blackberries', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Blueberries', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Carambolas: Star Fruit', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Cherimoyas', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Cherries', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Cherries: Maraschino', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Cranberries', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Dates', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Fruits', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Fruits: Citrus', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Fruits: Cocktail', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Grapefruit', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Grapes', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Huckleberries', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Kiwi Fruit', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Kumquats', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Lemons', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Limes', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Lychees', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Mandarins', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Mangos', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Muscanides & Products', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Nectarines', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Oranges', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Papaya', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Passion Fruit', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Peaches', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Pears', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Plums', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Raisins', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Raspberries', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Strawberries', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Tangelos', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Tangerines', 10, 7.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Additives', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Amaranth', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Bouillon', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Canola Oil', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Cereal', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Cheese Substitutes', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Chowder', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Citrus Oil', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Coating Mixes', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Concentrates', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Condiments', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Cooking wine', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Corn Oil', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Croutons', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Dips', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Dressings', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Eggs & Egg Products', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Flavorings', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fruit: Canned', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fruit: Processed', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fruit: Purees', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Gift Foods & Items', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Ginger', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Grocery Products', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Herbs', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Hops', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Horseradish', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Ice Cream Cones', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Ketchup', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Lard', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Main Entree/Pre-Mix', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Maple Products', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Margarine', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Marinade', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Mayonnaise', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Millet', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Mixes', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Mustard', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Oats & Oat Products', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Oils & Fats', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Olive Oil', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Pasta', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Peanut Butter', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Popcorn', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Quiche', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Relish', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Rice', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Salsa', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Salt', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Sandwiches', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Sauces', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Sauerkraut', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Shortening', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Soup/Stews', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Soybeans & Soy Products', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Spices and Seasonings', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Syrup', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Tartar Sauce', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Toppings', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Vegetable Oil', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Vinegar', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Wheat & Wheat Products', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Wild Rice', 11, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Health Foods', 12, 11.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Gluten Free', 12, 11.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Granola', 12, 11.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Health Foods', 12, 11.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Internal Breath Freshener', 12, 11.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Natural Foods', 12, 11.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Organic Foods', 12, 11.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Sprouts', 12, 11.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Tofu', 12, 11.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Vegetarian Foods', 12, 11.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Vitamins', 12, 11.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Ingredients Jams, Jellies, Marmalades & Preserves', 13, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Chutney', 13, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Honey', 13, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Jams/Jellies/Marmalades/ Preserves', 13, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Molasses', 13, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Pectin', 13, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Bacon', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Bar-B-Q', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Beef Products', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Beef: Jerky', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Bologna', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Buffalo', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Corned Beef', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Deli Products', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Game', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Ham', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Hotdogs', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Jerky', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Lamb', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Meat', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Meat: Canned', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Meat: Cured', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Meat: Deli Style', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Meat: Processed', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Meat: Products', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Meat: Smoked', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Ostrich/Emu', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Pastrami', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Pigs Feet', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Pork', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Pork: Processed', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Salami', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Sausage', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Veal', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Venison & Products', 14, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Christmas Trees', 15, 19.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Ferns', 15, 19.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fertilizer: Organic', 15, 19.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Flowers', 15, 19.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Nurseries', 15, 19.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Nursery Stock—Citrus', 15, 19.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Seeds & Seed Treatment', 15, 19.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Trees & Shrubs', 15, 19.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Wood Chips & Chunks', 15, 19.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Wreaths', 15, 19.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Chicken', 16, 8.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Duck & Duckling', 16, 8.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Poultry', 16, 8.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Poultry Products', 16, 8.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Quail', 16, 8.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Turkey', 16, 8.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Bluefish', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Catfish', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Caviar', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Clam Tongues', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Clams', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Crabs', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Crawfish', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fish', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fish: Canned', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Halibut', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Herring', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Lobster: Live & Frozen', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Mackerel', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Mussels', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Octopus', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Oysters', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Salmon', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Sardines', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Scallops', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Seafood', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Shark', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Shrimp', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Smoked Seafood', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Sturgeon', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Trout', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Tuna', 17, 12.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Almonds', 18, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Cashews', 18, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Grains', 18, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Hazelnuts', 18, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Oil Seeds', 18, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Peanuts', 18, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Pecans', 18, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Pistachios', 18, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Seeds & Nuts', 18, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Sunflower Seeds', 18, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Walnuts', 18, 6.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Chips & Crisps', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Ice Sticks', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Pretzels', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Snack Foods Specialty Foods', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Breakfast Foods', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Canned Foods', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Canned Meals', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Gourmet Foods', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Hors d’oeurves', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Microwavable Foods', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Pizza & Toppings', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Prepared Meals', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Retail Foods', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Shelf Stable Food', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Specialty Foods Tobacco Products', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Cigarettes', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Cigars', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Tobacco Products', 19, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Alfalfa Sprouts', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Asparagus', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Bean Products', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Beans', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Beans: Dry', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Beets', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Black-Eyed Peas', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Cabbage', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Carrots', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Cauliflower', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Celery', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Corn', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Corn Products', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Garlic', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Leeks', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Lettuce', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Mushrooms', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Okra', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Olives', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Onions', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Parsley', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Peas', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Peppers', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Pickles', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Potatoes & Potato Products', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Prunes', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Radishes', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Salad & Salad Mixes', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Shallots', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Spinach', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Squash', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Tomatoes & Tomato Products', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Vegetables', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Vegetables: Canned', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Vegetables: Processed', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Yams', 20, 5.99);
INSERT INTO food (name, catergory_id, price) VALUES ('Fresh: Zucchini Sticks', 20, 5.99);
