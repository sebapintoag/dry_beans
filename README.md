# DRY_BEANS Project



## How to run
## Option 1: using docker
### Requirements
- Docker
- Docker compose

### Instructions
1. Open a terminal and run `docker compose build`
2. Once the containers are built, run `docker compose up -d`
3. The app will be available on http://localhost:3000

## Option 2: running on your machine
## Requirements
- Ruby 3.2.2
- Bundler 2.5.
- Postgres installed and running

## Instructions
1. Open a terminal and run `bundle install` and wait to install all gems
2. Create a copy of the file `.env.example` in the root folder with the name `.env` and replace the values of the enviorment variables with your own
3. Then, run `rails db:create` to create a database for development and test enviorments
4. Finally, run `rails s` to run the project. The app will be available on http://localhost:3000