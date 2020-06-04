# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Screenshots of completed app

![Main](docs/main.png)
![Sign up](docs/signup.png)
![Log in](docs/login.png)
![Sold out](docs/soldout.png)
![Dashboard](docs/dashboard.png)
![Products](docs/products.png)
![Categories](docs/categories.png)
![Cart empty](docs/cart.png)
![Cart full](docs/cart2.png)
![Stripe 1](docs/stripe1.png)
![Stripe 2](docs/stripe2.png)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file with:
 - STRIPE_PUBLISHABLE_KEY=your_test_key_here
 - STRIPE_SECRET_KEY=your_test_key_here
 - HTTP_ADMIN_USER=your_admin_user
 - HTTP_ADMIN_PASSWORD=your_admin_password
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
