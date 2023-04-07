CREATE TABLE "runners" (
  "runner_id" INTEGER,
  "registration_date" DATE
);

CREATE TABLE "customer_orders" (
  "order_id" INTEGER,
  "customer_id" INTEGER,
  "pizza_id" INTEGER,
  "exclusions" VARCHAR(4),
  "extras" VARCHAR(4),
  "order_date" TIMESTAMP
);

CREATE TABLE "runner_orders" (
  "order_id" INTEGER,
  "runner_id" INTEGER,
  "pickup_time" VARCHAR(19),
  "distance" VARCHAR(7),
  "duration" VARCHAR(10),
  "cancellation" VARCHAR(23)
);

CREATE TABLE "pizza_recipes" (
  "pizza_id" INTEGER,
  "toppings" TEXT
);

CREATE TABLE "pizza_toppings" (
  "topping_id" INTEGER,
  "topping_name" TEXT
);

CREATE TABLE "pizza_names" (
  "pizza_id" INTEGER,
  "pizza_name" TEXT
);

ALTER TABLE "runner_orders" ADD FOREIGN KEY ("runner_id") REFERENCES "runners" ("runner_id");

ALTER TABLE "customer_orders" ADD FOREIGN KEY ("order_id") REFERENCES "runner_orders" ("order_id");

ALTER TABLE "customer_orders" ADD FOREIGN KEY ("pizza_id") REFERENCES "pizza_names" ("pizza_id");

ALTER TABLE "customer_orders" ADD FOREIGN KEY ("pizza_id") REFERENCES "pizza_recipes" ("pizza_id");

How many pizzas were ordered?
select count(pizza_id) as total
from customer_orders;

How many unique customer orders were made?
SELECT Count(*) AS Unique_orders
FROM (SELECT DISTINCT exclusions,extras FROM Customer_orders);

How many successful orders were delivered by each runner?
SELECT runner_id, Count(*) AS successful_orders
FROM runner_orders
where cancellation <> 'restaurant cancellation' or 'customer cancellation'
group by runner_id 
;

How many of each type of pizza was delivered?
SELECT pizza_id, Count(pizza_id) as Total_amount_ordered
FROM customer_orders
group by pizza_id 
;
How many Vegetarian and Meatlovers were ordered by each customer?
SELECT customer_id, pizza_id,count(pizza_id) as total
FROM customer_orders
group by customer_id, pizza_id
;
What was the maximum number of pizzas delivered in a single order?
select order_id, max(total)
from (select order_id, count(pizza_id) as total 
from customer_orders
group by order_id)
;
For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
How many pizzas were delivered that had both exclusions and extras?
What was the total volume of pizzas ordered for each hour of the day?
What was the volume of orders for each day of the week?
