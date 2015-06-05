## No You Choose

### Features

* Make a plan between two users (or many)

  1. Choose location
  2. Choose Date/Time
  3. Invite People to plan
  4. Do you want to add cuisines?
  5. Do you want to add price ranges?


### Database

User            |   Data Type   |
----------------|---------------|-------
name            |   string      |
phone_number    |   string      |
password_digest |   string      |


Plan            |   Data Type   | Notes
----------------|---------------|-------
zipcode         |  string       | for location purposes
time            |  string       |
min_price       |  integer      | number between 1 & 5
max_price       |  integer      | number between 1 & 5

Cuisine   |  Data Type
----------|---------------
title     |  string

Restaurant     | Data Type
---------------|-------------
yelp_id        | integer

UsersPlans
-----------
  user_id
  plan_id

PlansCuisines
-------------
  plan_id
  cuisine_id

Rights #yes'
-------------
  user_id
  plan_id
  rest_id
