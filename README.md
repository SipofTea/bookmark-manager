# Bookmark Manager on the Web

This web app aims to let people save, manage, and use their bookmarks. These goals will be achieved through using BDD and TDD driven development cycles.

## Instructions
**Set up project**
* Clone the project to a local directory using `git clone https://github.com/SipofTea/bookmark-manager.git`.
* In the root of the project directory run `bundle`.

**Set up database**

* Ensure PostgreSQL is installed and set up.
* Connect to psql (`psql postgres`).
* Create the development and testing databases. 
 
```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

* Connect to development database (`\c bookmark_manager;`).
* Run SQL scripts in `db/migrations` in given order.
* Repeat connection and script steps for the test database.

**Run app**

To run the app execute `rackup -p 4567` in the command line.

Visit http://localhost:4567/ for the index page.

Visit http://localhost:4567/bookmarks for the list of bookmarks.

Visit http://localhost:4567/bookmarks/new to add a new bookmark.

**Run tests**

To run tests execute `rspec` in the command line from the project root directory.

## Specification (🔴 TODO, 🟢 Complete)
* Show a list of bookmarks 🟢
* Add new bookmarks 🟢
* Delete bookmarks 🟢
* Update bookmarks 🔴
* Comment on bookmarks 🔴
* Tag bookmarks into categories 🔴
* Filter bookmarks by tag 🔴
* Users are restricted to manage only their own bookmarks 🔴

## User Stories
Story 1
```
As a user	
So that I can see what websites I saved	
I want to see a list of my bookmarks
```
**Domain Model**
![Domain model for list of bookmarks user story](/public/images/domain_model_user_story_1.jpeg)
Story 2
```
As a user
So that I can save websites
I want to create and save bookmarks
```
Story 3
```
As a user
So that I can delete websites I no longer want to remember
I want to delete bookmarks from my list
```
