# _Lark in the Park_

#### By _**Dominic Brown**_

_(Independent project @ Epicodus - 7/21/17)_

## Description

This small app provides a simple public API endpoint for looking up state and national parks in the USA.

## User stories

* As a user, I want to make a call to return a list of all state parks.
* As a user, I want to make a call to return a list of all national parks.
* As a user, I want to make a call to return a list of all parks for a single state.
* As a user, I want to make a call to return a random park.
* As a user, I want to make a custom call that searches for parks using my input.
* As a user, I want my calls to return on multiple pages so I don't receive too much data at once.
* As a user, I want my calls to return serialized data (i.e. 'park' data is nested under 'state' ).

## API endpoints

| Method | URL | URL Params | Success Response | Error Response |
|:---------:|-------|--------|
| | _**STATES PATH**_ |||
| GET | http://localhost:3000/ | Optional: name=[string] |
| GET | http://localhost:3000/states | Optional: name=[string] |
| POST | http://localhost:3000/states | N/A |
| GET | http://localhost:3000/states/:id | id=[integer] |
| PUT/PATCH | http://localhost:3000/states/:id | id=[integer] |
| DELETE | http://localhost:3000/states/:id | id=[integer] |
| | _**PARKS PATH**_ | |
| GET | http://localhost:3000/states/:state_id/parks | state_id=[integer] |
| POST | http://localhost:3000/states/:state_id/parks | state_id=[integer] |
| GET | http://localhost:3000/states/:state_id/parks | state_id=[integer], id=[integer] |
| POST | http://localhost:3000/states/:state_id/parks | state_id=[integer], id=[integer] |
| PUT/PATCH | http://localhost:3000/states/:state_id/parks | state_id=[integer], id=[integer] |
| DELETE | http://localhost:3000/states/:state_id/parks | state_id=[integer], id=[integer] |

## Prerequisites

* [Git](https://git-scm.com/)
* [Ruby](https://www.ruby-lang.org/en/)
* [Rails](http://rubyonrails.org/)
* [postgreSQL](https://www.postgresql.org/)
* [bundler](http://bundler.io/)

## Setup

(using OSX terminal, or Gitbash on Windows: run the following commands)
* $`git clone https://github.com/Umitosan/lark_in_the_park.git`
* $`cd `
* $`bundle install`
* $`rake db:setup`

### Run

Start postgres if you don't already have it configured as a service by running this in a separate terminal window
* $`postgres`
Start the server
* $`rails s`
In your browser navigate to:
* `localhost:3000`

## Known Bugs
_N/A_

## Technologies Used
 * Rails
 * Ruby
 * postgreSQL
 * CSS
 * Bootstrap
 * HTML

 ### License
 *This software is licensed under the MIT license*
 Copyright © 2017 **Dominic Brown**
