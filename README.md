Chitter Challenge ![Travis CI](https://travis-ci.org/sliute/chitter-challenge.svg?branch=master) [![Coverage Status](https://coveralls.io/repos/github/sliute/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/sliute/chitter-challenge?branch=master)
=================

Task (Stories)
-------

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Notes on functionality
------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.

Technologies
-------

Development & use:

* Ruby
* DataMapper with dm-postgres-adapter
* Postgresql
* Bcrypt
* Sinatra with Sinatra Flash and Sinatra Partial
* Heroku

Testing:

* Rspec with rspec-sinatra
* Capybara
* Database Cleaner
* Rake
* Rubocop with rubocop-rspec
* Travis CI
* Coveralls

How To Download and Run the App
-------

```
$ git clone https://github.com/sliute/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ psql
$ create database chitter_test
$ create database chitter_development
$ \q
$ rake auto_migrate
$ rspec
$ rackup
```

... then open [localhost:9292](http://localhost:9292) in a browser and enjoy.

Or you can go straight to [Heroku](https://shielded-tundra-78712.herokuapp.com) to play with it.

Progress
-----

1. Story 01:
  * A user can sign up for Chitter. Feature tests check for:
    - the email and username to exist and both be unique
    - the name to exist.

  Unit tests check for user authentication (with email and password).

2. Story 02:
  * A user can sign into Chitter. Feature tests check for the process to:
    - succeed with correct username and password (a name-specific greeting is displayed)
    - fail with incorrect username and/or password (an error message is displayed and the user is redirected to the sign in form)

3. Story 03:
  * A user can sign out of Chitter. Feature tests check for the `Sign out` button to work and display a page where:
    - a sign out confirmation message is displayed
    - the user's salutation by name is absent

4. Story 04:
  * When a user signs in, they can
    - see their own peep list
    - create a new peep via a dedicated peep form.
  * Each peep has a header with the user's name and username
  * The public can freely access a user's peep list at `/username`.
  * A user can post only if they have signed in. Otherwise, they are redirected to the sign in page. A signup button is available there, too.

5. Story 05:
  * When a user signs in, they can:
    - go to a new peep form via a button
    - see a flow of all Chitter users' peeps, in reverse chronological order.  

6. Story 06:
  * When a user signs in, they can:
    - see a flow of all Chitter users' peeps, in reverse chronological order, and each with a timestamp

7. Cleanup #1:
  * Displayed time in a Twitter-like format with the .strftime above.
  * Added buttons on various pages to make navigation across the app easier.
  * Cleaned up dead code and unnecessary requires (models in spec_helper). Tests still pass :-)

Issues
-----

1. Story 01:
  * I learned that if you run tests locally (or via Travis CI) with the proper databases in place but before actually creating a User table, you will encounter this database error:
  ```
  ERROR:  syntax error at or near "IDENTITY" (DataObjects::SyntaxError)
  LINE 1: TRUNCATE TABLE  RESTART IDENTITY;
                                ^
    from /Users/
  ```
  Once the table is in place (i.e. after running the app once and creating a user), everything worked well - I didn't need the workaround I had found [here](https://github.com/makersacademy/slack-overflow/issues/180).
  * Unit tests for user authentication might be premature (better suited for Story 02?)

2. Story 02:
  * More thorough unit testing might be required for the User.rb model. Aside from #authenticate, a test for #password= might be needed.

3. Story 03:
  * Nothing so far.

4. Story 04:
  * Nothing so far.

5. Story 05:
  * I have an idea about how to test for the reverse chronological order, but no clue about how to exactly implement it.
  * Need to also add a 'profile' page where a user can see the list of their own tweets, in reverse chronological order.

6. Story 06:
  * Need to display the time in a friendly format. Directly applying `.strftime('%l:%m %p - %e %b %Y')` to the time objects somehow yields an error that signals they're nil (and not time objects after all).

7. Cleanup #1:
  * Need to add password reset functionality. Did it in the week's assignment (except for a 301 redirect error from Mailgun).
  * Haven't used cucumber and factory_girl, although I wanted to.
  * Need to add uniqueness tests - I think I've missed them so far.
