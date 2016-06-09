[![Build Status](https://travis-ci.org/eilw/pland.svg?branch=master)](https://travis-ci.org/eilw/pland)

== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




Order has many items, cost (decimal), volume(integer), shipping cost(decimal), total cost, status

Item has a steel_type, steel_width, steel_finish, volume(integer), price_per_kg (to be calculated), cost

Steel_type has type type-grade-ls/, cost

Steel_finish has type, cost

Todo:
- On order page, add link to submit items. - DONE
- Item - give spaces for volume - DONE
- Item - calculate the price/kg - DONE
- Item - calculate the total cost of the item - DONE
- Item - remove cost from column - DONE
- Item - add blank spaces to seed data -DONE
- Item - link each item link to an order - DONE
- Order page: add additional items - DONE
- Delete account model as part of user
- Make each order link to a user
- Clicking create a new order, goes to 'new item' part
- After adding an item, goes to see the order overview, with an add item
  link on it
- Print out the item details for each item
- Calculate the cost per each item
- Calculate the cost for the whole order
- add a edit button for each item
- Add validations to order and the item
