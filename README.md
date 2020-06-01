# Backend Software Engineering Project

> ### **JSON API** build in Sinatra for **[Broadvoice](https://www.broadvoice.com/)**.

## Problem
Create a JSON API application with three models: Person, Company, and City. People work for companies and live in Cities.

* Person Attributes: name, email
* Company Attributes: name
* City Attributes: name, state (two letter abbreviation)

Implement the index endpoints that list People, Companies, and Cities. Also, create a show endpoint that provides all the details 
for a given Person ID.

## System Dependencies

### Ruby
This web API is a [Sinatra application](http://sinatrarb.com/), so we need to have [Ruby](https://www.ruby-lang.org/en/) 
installed. Let's check if we have it by running the following command: 

```bash
ruby -v 
``` 

If Ruby responds with a version number, we can skip the next step.

In case we have to install Ruby, we recommend using [RVM (Ruby Version Manager)](https://rvm.io):

```bash
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby
```

In case there is any problem, we can follow the [RVM install guide](https://rvm.io/rvm/install) in more details. 

In the root folder of our project we can find the `.versions.conf` file with the Ruby version and Gemset we use:

```conf
ruby=ruby-2.7.1
ruby-gemset=broadvoice-api
```

By `cd path/to/boradvoice-api`, RVM will detect and advice on how to install the proper ruby version, equivalent to the
following commands:

```bash
rvm install ruby-2.7.1
rvm gemset create broadvoice-api
rvm use 2.7.1@broadvoice-api
```

### SQLite
This project uses [SQLite](https://www.sqlite.org/index.html) for persisting data. Let's check if we have SQLite installed 
by running its version command: 

```bash
sqlite3 --version
```

If we get an error, we can follow [these instructions](https://www.tutorialspoint.com/sqlite/sqlite_installation.htm) 
to continue with the installation. Mac OS users can install it via [Homebrew](https://brew.sh/):

```bash
brew install sqlite3
```

## Running the Application

Let's navigate to the project folder and install [bundler](https://bundler.io/) as package manager:

```bash
cd path/to/boradvoice-api
gem install bundler
```

Then, it is time to install the required gems:

```bash
bundle
```

The are several environment variables used by the application. In order to set its values, let's create an .env file in 
the project root folder, and then paste and adapt the following configuration:

```dotenv
# Server
RACK_ENV=development
PORT=3000
WEB_CONCURRENCY=2
THREAD_COUNT=4

# DB
DB_DEVELOPMENT=db/development.sqlite3
DB_TEST=db/test.sqlite3
DB_PRODUCTION=db/production.sqlite3
```

Lastly, we have to initialize the DB, migrate and seed the data with sample cities, companies and people:

```bash
rake db:create
rake db:migrate
rake db:seed
```

To start our app we have to fire the [Puma](https://puma.io/) web server:

```bash
bundle exec puma -C ./config/puma.rb
```

## Project Structure

```
 ├──  Gemfile.................................... Packages dependencies
 ├──  app.rb..................................... Application's entry point
 └──  api/....................................... Web API components 
 │  └────  endpoints/............................   API endpoints
 │  └────  parsers/..............................   Query string parsers (data and presentation options)
 │  └────  presenters/...........................   Objects presenters in JSON format (errors and models)
 └──  config/.................................... Application configuration
 │  ├────  active_record.rb......................   ActiveRecord settings
 │  ├────  database.yml..........................   Database connection parameters
 │  ├────  environment.rb........................   Common configuration and depdencies loader
 │  ├────  extensions.rb.........................   Framework extensions (Json, Namespaces and Reloader)
 │  ├────  puma.rb...............................   Puma web server configuration
 │  └────  sinatra.rb............................   Sinatra framework settings
 └──  core/...................................... Core domain components (Business Logic)
 │  └────  cities/...............................   Cities models and services
 │  └────  common/...............................   Common services and shared utilities
 │  └────  companies/............................   Companies models and services
 │  └────  people/...............................   Poeple models and services
 └──  db/........................................ Database definition
 │  └────  migrate/..............................   DB Migrations
 │  ├────  schema.rb.............................   ActiveRecord schema definition
 │  ├────  seeds.rb..............................   Script seeding the DB with sample data
 └──  spec/...................................... Behavior and Unit testing
 │  └────  api/..................................   Web API test examples (parsers, presenters and endpoints)
 │  └────  core/.................................   Business domain test examples (models and services)
 │  └────  support/..............................   Common testing tools
 │  ├────  spec_helper.rb........................   RSpec configuration and depdencies loader 
```

## Testing
This project, like many other Ruby applications, uses [RSpec](https://rspec.info/) to test unit and behavior. Before running 
the tests, we have to prepare our testing database:

```bash
rake db:prepare
```

To then run the testing examples:

```bash
rspec
```

## Deployment

Deployment is not part of this exercise, but we recommend deploying to [Heroku](https://www.heroku.com/) later on
following this guide [Heroku guide](https://devcenter.heroku.com/articles/getting-started-with-ruby#introduction).

