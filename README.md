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
name            |               |
phone_number    |               |
password_digest |               |

Plan
-----
  location
  time
  min_price
  max_price

Cuisine
--------
  title

Restaurant
------------
  yelp_id

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
