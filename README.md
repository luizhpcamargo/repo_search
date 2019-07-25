# Repos search

Project to find the 5 repositories with more stars from 5 languages (ruby, elixir, python, javascript and go) from github.

## Prerequisites

Ruby 2.5.0

Rails 5.2.3

PostgreSQL

*SQLite for development and tests

## Getting Started

clone: `git clone git@github.com:luizhpcamargo/repo_search/.git`

install gems: `bundle install`

update database: `rake db:setup`

start server: `rails s`

For default the project will run on `http://localhost:3000`

## Tests

Test suite made with rspec

to run the suite you can use: `rspec spec`

To update the test database: `rake db:test:prepare`

## Heroku
http://repos-search-luiz.herokuapp.com/

## Somethings to improve

- Do more tests with controller
- A better query to bring the repositories
- A better control to the new projects with more stars
- Fix CSS
