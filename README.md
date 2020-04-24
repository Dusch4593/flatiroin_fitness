# **Flatiron Fitness**
---
A simple Sinatra web-application that lets users create an account for creating exercise routines. It uses ActiveRecord for database management and user authentication. Users can have many routines; each routine can be composed of many exercises. Each exercise has a `sets` and `reps`.

`sets` are the number of a specific exercise in a routine

`reps` are the number of repetitions completed in the exercise



# Installation
---
Run `rake db: migrate` to set up the database and `shotgun` to start the server.

Depending on what version of `rake` and `shotgun` you're using, you may have precede them with `bundle exec`.

# Usage
---
The User can sign up and create an account with a username, an email and password.

They can then create `:routines` by either choosing one that already exists or creating a new one. Within those routines, the user can create `:exercises` (same thing, either choose from existing ones or create new ones). 

The user can only perform CRUD actions on routines and exercises that belongs to ***them***.

# Contributing
---
I'm open to any and all suggestions on improving the application. Feel free to [create a pull request]() or [report any issues]().

# License
---
This app is available as open source under the term of [MIT License](https://opensource.org/licenses/MIT)
