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


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.


Order has many items, cost (decimal), volume(integer), shipping cost(decimal), total cost, status

Item has a steel_type, steel_width, steel_finish, volume(integer), price_per_kg (to be calculated), cost

Steel_type has type type-grade-ls/, cost

Steel_finish has type, cost
