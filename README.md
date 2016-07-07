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
- Delete account model as part of user - DONE
- Make each order link to a user - DONE
- Make the nested order link work - DONE
- Clicking create a new order, goes to 'new item' part - DONE
- After adding an item, goes to see the order overview, with an add item link on it - DONE
- Print out the item details for each item - DONE
- Add factory girl to test for item cost - DONE
- Add cost for volume differences - DONE
- Calculate the cost for the item once the order is built - DONE
- migration add transport and total cost to order model - DONE
- Calculate the cost for the whole order - DONE
- Add a submit button to change order from DRAFT to REQUEST - DONE
- add a edit button for each item - DONE
- Add tests that were deleted for make a quote - DONE
- Add tests & validations to order and the item - DONE
  - Delete all child instances of parent instances (e.g. users / orders,
    etc) - DONE
  - All items must have one of the options selected, including volume
    - DONE
  - volume must be a minimum of 1000kg? DONE
  - user must be logged in to see the various orders / quotes - DONE
- add validation for minimum volume of 1000kg - DONE
- add total volume to order - DONE
- add comment field to order - DONE
- add thanks message for new quote - DONE
- User can see the comment they have added, and can edit that specific
  - DONE

Need internet connection
  box
- add in thanks message for new account 
- add validations to if order cannot be received
- check with andrew if transport costs are for total weight, or per
  item?
- Check with andrew how the minimum costs work?
- add error messages if a value from the form is missing
- Update mailer to get to work
- Fix Diametro to just show which options are valid for MIG / TIG
- Get price per kg dynamically after diametro has been selected
- Refactor into a form object
