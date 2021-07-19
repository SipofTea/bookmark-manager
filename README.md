# Bookmark Manager on the Web

This web app aims to let people save, manage, and use their bookmarks. These goals will be achieved through using BDD and TDD driven development cycles.

## Instructions
**Set up database**
* Ensure PostgreSQL is installed and set up

* Connect to psql (`psql postgres`)

* Create database (`CREATE DATABASE bookmark_manager;`)

* Connect to database (`\c bookmark_manager;`)

* Run SQL scripts in `db/migrations` in given order.

**Run app**
To run the app execute `rackup -p 4567` in the command line.
Visit http://localhost:4567/ for the index page.
Visit http://localhost:4567/bookmarks for the (currently empty) list of bookmarks.

**Run tests**
To run tests execute `rspec` in the command line from the project root directory .

## Specification (🔴 TODO, 🟢 Complete)
* Show a list of bookmarks 🟢

* Add new bookmarks 🔴

* Delete bookmarks 🔴

* Update bookmarks 🔴

* Comment on bookmarks 🔴

* Tag bookmarks into categories 🔴

* Filter bookmarks by tag 🔴

* Users are restricted to manage only their own bookmarks 🔴

## User Stories
As a user	

So that I can see what websites I saved	

I want to see a list of my bookmarks

**Domain Model**
![Domain model for list of bookmarks user story](/public/images/domain_model_user_story_1.jpeg)
