# `Address Book` Application

## Overview

The Address Book application is a CRUD (Create, Read, Update, Delete) web application built with Ruby on Rails. It allows you to manage contact information, including people, addresses, email addresses, and phone numbers. The application also serves as an API that accepts and sends requests/responses in JSON format.

## Features

- Create, read, update, and delete (CRUD) operations for:
    - People
    - Addresses
    - Email addresses
    - Phone numbers
- User authentication with password hashing (using bcrypt)
- Bootstrap-based UI for a pleasant user experience
- PostgreSQL database for data persistence

## Getting Started

These instructions will help you set up and run the Address Book application locally on your machine.

### Prerequisites

- Ruby (version >= 2.7.0)
- Ruby on Rails (version >= 6.0.0)
- PostgreSQL

### Installation

## Clone the repository to your local machine:

   ```bash
   git clone https://github.com/yourusername/address-book.git
   ```

## Change into the project directory:

   ```bash
   cd address-book
   ```

## Install gem dependencies:

   ```bash
   bundle install
   ```

## PostgreSQL Setup on Windows

### Step 1: Open Command Prompt as an Administrator

Start Command Prompt with administrative privileges.

### Step 2: Switch to PostgreSQL User

Switch to the PostgreSQL user, usually `postgres`, by running:

  ```bash
  psql -U postgres
  ```

### Step 3: Log in to PostgreSQL

You'll be prompted to enter the password for the `postgres` user, which you set during the PostgreSQL installation.

### Step 4: Create a New Role

Run the following SQL command to create a new PostgreSQL role:

   ```sql
   CREATE ROLE new_role_name WITH LOGIN PASSWORD 'your_password';
   ```

Replace `new_role_name` with your desired role name and `your_password` with your desired password.

### Step 5: Grant Permissions to the New Role

To grant the necessary permissions to your new role, run:

   ```sql
   ALTER ROLE new_role_name CREATEDB;
   ```

### Step 6: Exit PostgreSQL Command Line

Type `\q` and press Enter to exit the PostgreSQL command line.

## Rails Database Configuration

After creating the PostgreSQL role, you'll need to configure your Rails application to use it. Open your `config/database.yml` file and update it as follows:

   ```yml
    default: &default
    adapter: postgresql
    encoding: unicode
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

    development:
    <<: *default
    database: your_database_name_development
    username: new_role_name
    password: your_password

    test:
    <<: *default
    database: your_database_name_test
    username: new_role_name
    password: your_password

    production:
    <<: *default
    database: your_database_name_production
    username: new_role_name
    password: your_password
  ```

Replace `your_database_name` with the name you want for your database, and `new_role_name` and `your_password` with the role name and password you created earlier.

## PostgreSQL Setup on macOS

### Step 1: Install PostgreSQL

If you haven't installed PostgreSQL on your Mac yet, you can use Homebrew to do so:

   ```bash
   brew install postgresql
   ```

After installing, start the PostgreSQL service:

   ```bash
   brew services start postgresql
   ```

### Step 2: Create a PostgreSQL Role

To create a new PostgreSQL role, open Terminal and run:

   ```bash
   createuser -d new_role_name
   ```

Replace `new_role_name` with the name you want for your role. The `-d` flag allows this new user to create databases, which is necessary for running `rails db:create`.

### Step 3: Set Role Password

Log into PostgreSQL interactive terminal:

   ```bash
   psql postgres
   ```

Then, set a password for the new role:

   ```sql
   \password new_role_name
   ```

Follow the instructions to enter the password.

### Step 4: Exit PostgreSQL

Type `\q` and press Enter to exit the PostgreSQL interactive terminal.

## Rails Database Configuration

Follow the same Rails Database Configuration steps as mentioned in the section for Windows to update your `config/database.yml` file.

## Create and Migrate Database
After setting up the role and updating the configuration, you can now create and migrate your database:

   ```bash
   rails db:create
   rails db:migrate
   ```

## Start the Rails server:

   ```bash
   rails server
   ```

Open a web browser and visit [http://localhost:3000](http://localhost:3000) to access the application.

### Usage

- Sign up as a new user or log in with your credentials.
- Add, view, edit, and delete people, addresses, email addresses, and phone numbers.
- Use the API endpoints for programmatic access to data.

### API Endpoints

The application provides the following API endpoints for JSON-based CRUD operations:

- `/api/v1/people`
- `/api/v1/people/:id/addresses`
- `/api/v1/people/:id/emails`
- `/api/v1/people/:id/phone_numbers`

You can make HTTP requests to these endpoints to interact with the application programmatically.

## Built With

- Ruby on Rails - The web framework used
- PostgreSQL - The relational database used
- Bootstrap - The CSS framework for UI styling

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
