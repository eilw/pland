[![Build Status](https://travis-ci.org/eilw/pland.svg?branch=master)](https://travis-ci.org/eilw/pland)

== README

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
  - Delete all child instances of parent instances (e.g. users / orders, etc) - DONE
  - All items must have one of the options selected, including volume- DONE
  - volume must be a minimum of 1000kg? DONE
  - user must be logged in to see the various orders / quotes - DONE
- add validation for minimum volume of 1000kg - DONE
- add total volume to order - DONE
- add comment field to order - DONE
- add thanks message for new quote - DONE
- User can see the comment they have added, and can edit that specific - DONE
- add account functionality for Andrew - DONE
- add validations for sign-up: frontend & backend - Done
- Update mailer to get to work - DONE
  - Add a mail to be sent to andrew once a user has signed up - DONE
  - sendt the contact form to andrew - DONE
  - add tests to mailers - DONE
- Get price per kg dynamically after diametro has been selected - DONE
- Refactor into a form object - DONE
- See updated price in each view (item / order) - DONE
- Change validation of item to 100kg - DONE
- Add dynamic forms for type / grade / diameter - DONE 
- only update price when all three dropdowns have been selected - DONE
- add linters so it picks up - DONE
- Add additional types of transport - DONE
- Add ajax link for transport and comment - DONE

- Add possibility to delete an item - DONE
- Add currency - DONE
- Only make api calls to price_kg if all three have parameters
- Error -no admin = nil when first user is created
- Fix nil error in order cost + add other validation
- add formobject validations

- Remove existing orders link
- See the cost of transport per kg under the total cost of transport
- Add validation of total order to 1000kg
- add in thanks message for new account 
- add validations to if order cannot be received
- add error messages if a value from the form is missing
- Update CI to work
- Add in PDF option for old quotes
- Change how you can intereact with orders given their order status
- Admin dealing with orders
- change name in submit box for item

- get the resend password to work on heroku
- change title of resend email 
- ADMIN: update prices for steel database 
- Change order id -> uid, se activerecord gem
