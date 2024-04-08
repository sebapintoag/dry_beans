# DRY_BEANS Project
- Ruby version: 3.2.2
- Ruby on Rails version: 7.1.3.2

## How to run
## Option 1: using docker
### Requirements
- Docker
- Docker compose

### Instructions
1. Open a terminal and run `docker compose build`
2. Once the containers are built, run `docker compose up -d`
3. The app will be available on http://localhost:3000

#### If you're running this project for the first time...
1. Run `docker-compose run -it web rails db:create` to create databases for development and test enviorments.
2. Run `docker-compose run -it web rails db:migrate` to run migrations and create tables
3. Run `docker-compose run -it web rails db:seed` to populate the database

#### To run specs...
1. Run `docker-compose run -it web rspec` to run all tests

## Option 2: running on your machine
### Requirements
- Ruby 3.2.2
- Bundler 2.5.
- Postgres installed and running

### Instructions
1. Open a terminal and run `bundle install` and wait to install all gems
2. Create a copy of the file `.env.example` in the root folder with the name `.env` and replace the values of the enviorment variables with your own
3. Finally, run `rails s` to run the project. The app will be available on http://localhost:3000

#### If you're running this project for the first time...
1. Run `rails db:create` to create a database for development and test enviorments
2. Run `rails db:migrate` to run migrations and create tables
3. Run `rails db:seed` to populate the database

#### To run specs...
1. Run ` rspec` to run all tests

### Routes
**Examples of use in Postman collection: `postman/dry_beans.postman_collection.json`**
- [GET] `/routes`: returns all routes with (simplified data)
- [GET] `/routes/:id`: returns a single route by ID (extended data)
- [PUT] `/deliveries/:id/deliver`: completes a delivery. Requires reception data (see Postman collection).
- [PUT] `/pickups/:id/pickup`: completes a pickup.
