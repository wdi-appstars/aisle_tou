CREATE DATABASE aisle_tou;

\c aisle_tou;

CREATE TABLE users (id SERIAL PRIMARY KEY, email_adress varchar(255), passowrd_hash varchar(255), password_salt varchar(255));

CREATE TABLE deliveries (id SERIAL PRIMARY KEY, date date, time_of_day_id int, basket_id int, user_id int);

CREATE TABLE baskets (id SERIAL PRIMARY KEY, total_price decimal, item_count int, user_id int);

CREATE TABLE basket_items (id SERIAL PRIMARY KEY, basket_id int, food_id int, item_count int, scheduled boolean);

CREATE TABLE food (id SERIAL PRIMARY KEY, name varchar(255), catergory_id int);

CREATE TABLE food_categories (id SERIAL PRIMARY KEY, name varchar(255));

CREATE TABLE time_of_days (id SERIAL PRIMARY KEY, name varchar(255));
