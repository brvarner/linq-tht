# Linq Take Home Test

Hello! My name is Brandon, and I appreciate the opportunity to take this test. On to business!

This is a Rails/Postgres app with Bootstrap styling. It lets users create contacts by entering a name and email, and search the list of contacts with a search bar embedded in the Contacts table.

We'll start with info on setup, then move to an explanation of features, then explain what's missing from the app.

## Table of Contents
1. [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [.env config](#env-config)
2. [Features](#Features)
    - [What's Here](#whats-here)
    - [What's Missing](#whats-missing)

## Getting Started

### Prerequisites
You need:
- At least Rails 7.1.3.4 (I built this app on Rails 8, but I don't use many Rails 8 features, and it works well on Rails 7)
- At least PostgreSQL 14.12
- At least Bundler 2.5.14
- At least Ruby 3.3.3
- (Optional) I built this app with WSL2. If you'd like to run it on your local machine: [Here's a guide](https://gorails.com/setup/windows/10). I ran Ubuntu 22.04 in the WSL2 shell.

 ### Installation
 Running this app is quite simple:
1. Clone the app into your chosen directory
  ```bash
  https://github.com/brvarner/linq-tht.git
  ```
2. Navigate to the app directory in your terminal
  ```bash
  cd linq-tht
  ```
3. Install the project's gems with the bundle command in your terminal
  ```bash
  bundle
  ```
3.5 Set up your .env file (instructions below)

4. Create the tables and run the necessary migrations
   ```bash
   rails db:create db:bundle
   ```
5. (Optional) If you want some contacts in the table to test search functionality before you create a contact, you can seed the database
   ```bash
   rails db:seed
   ```
6. Start the rails server
   ```bash
   rails s
   ```
7. Visit `http://localhost:3000` to view the application in your browser of choice. 

### .env config
Here's an example of the .env. It's set up to use "postgres" as the username and whichever system password you use for postgres on your machine.

```
DB_HOST=localhost
DB_PORT=5432
DB_USERNAME=postgres
DB_PASSWORD=your_password_here
RAILS_MAX_THREADS=5
```

## Features

### What's Here
This app has some cool features! I was able to implement the following:
- Fuzzy search driven by PostgreSQL's Full Text Search thanks to the pg_search gem
- Bootstrap styling via its CDN link
- Validations in the model to ensure there are no duplicate emails (I figured duplicate names were ok but emails can be a primary key for complex operations in the future)
#### Tradeoffs
- The fuzzy search doesn't do well with partial strings for name or email which is something I wish I had time to do
- There's no real reset button after the search if it returns something, so you have to search with an empty text box to bring back the full table
- Validations exist, but take user to the show view from the contacts controller instead of popping up a notice on the index page, which is the app's homepage
- I'd like to put guardrails up and keep the user solely on the app's homepage, but for now, you can navigate to several unfinished pages

### What's Missing
There are a few missing features I wanted to add:
- The biggest one is containerization with Docker. I wrestled with configuring a container for a while but decided to abandon it when it started eating up too much time.
- Tests would be nice, I enjoy the built-in tests in the tests folder at root, but some more specific tests of the fuzzy search would've been keen.
