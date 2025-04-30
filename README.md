# Tea Subscription - BE

The backend API for my Tea Subscription application, a sercive for managing a tea subscription service. Built using Ruby on Rails and PostgreSQL, This API supports getting information on subscriptions as well as toggling their activation status.

---

<details>
  <summary><strong>Tech Stack</strong></summary>

  - **Ruby on Rails** 7+
  - **PostgreSQL**
  - **RSpec** for testing
</details>

---

<details>
  <summary><strong>Setup & Installation</strong></summary>

## Setup & Installation

1. Clone the repository
`git clone`

2. Navigate into the project folder
`cd tea-subscription`

3. Install dependencies
`bundle install`

4. Set up the database
`rails db:create
rails db:migrate
rails db:seed`

5. Run the server
`rails s`
</details>

---

<details>
  <summary><strong>API Endpoints</strong></summary>

All endpoints are namespaced under: `/api/v1`

| Method | Endpoint               | Description                                                  |
|--------|------------------------|--------------------------------------------------------------|
| GET    | `/subscriptions`       | Returns a list of all subscriptions.                         |
| GET    | `/subscriptions/:id`   | Returns a specific subscription by ID                        |
| PATCH   | `/subscriptions/:id`  | allows updating of a subscriptions status                    |
</details>
