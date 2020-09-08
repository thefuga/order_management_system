# Order management system

This is the solution for the problem proposed [here](https://gist.github.com/pedrofs/dd76059b028dfdca32c56b5e25729d50).

A state machine ([aasm](https://github.com/aasm/aasm)) is used to control the order states.

### Requirements

This was developed using Rails `6.0.3.2` and Ruby `2.7.1` (the latest available at the moment).

Meeting their requirements should be enough to run the application.

### Running the application

Just runt `bundler install` and `rails server`.

### Tests

The tests are performed by minitest. Run `rails test` to execute them.

### Available routes

Bellow are the routes available for the application. All can be accessed directly through the index (e.g.: `localhost:3000`, if running locally).

| Endpoint          | Description                    |
| ----------------- | ------------------------------ |
| GET /orders       | List all orders on the system. |
| GET /orders/new   | Form for creating an order     |
| POST /orders      | Create a new order             |
| PATCH /orders/:id | Updates the order              |

##### Filters

There are a couple of filters available at `/orders`. They can also be set in the HTML page.

| Query string param | Accepted values                 | Description                                          |
| ------------------ | ------------------------------- | ---------------------------------------------------- |
| state              | pending, in_progress, completed | Filters the listed orders by state                   |
| control_number     | any integer value               | Finds the order corresponding to that control number |

