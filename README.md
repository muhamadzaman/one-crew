# OneCrew

This is simple application where users can be registered as client or contractor, client can post a job and contractor and can provide estimates on the job.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing


* Ruby version
 2.7.3

 ```
 rvm install 2.7.3
 ```
* Database
postgresql

```
brew install postgres
```


* Clone the repository


```

git clone https://github.com/usmanasif/one-crew.git

cd one-crew
```

* Install Gems
```
bundle install
```

* Database creation

```
  rails db:create
  rails db:migrate
```

* Populate Database with initial data
```
ADMIN_PASSWORD=password ADMIN_EMAIL=admin@example.com rails db:seed
```
### Using API
* Run app on port 3000
```
bundle exec rails s
```
* Register some user
- URL
````
http://localhost:3000/auth
````
- Request method
```
Post
```
- sample Payload
```
{
  "email": "client@example.com",
  "name": "client",
  "password": "password",
  "password_confirmation": "password"
}
```
- By default its role will be placeholder
- Please sign in as admin to update users role
- To sign in
- URL
````
http://localhost:3000/auth/sign_in
````
- Request method
```
Post
```
- sample Payload
```
{
  "email": "admin@example.com",
  "password": "password",
}
```
- This will provide uid, access-token and client in response headers, these will be needed to set in any request headers in any request

- To update role
- URL
````
http://localhost:3000/users/:user_id
````
- Request method
```
Post
```
- sample Payload
```
{
  "user": {
      "role": "client"
  }
}
```
- Similarly please create another user with role=contractor
- Create a job
- Only users with role=client can create a job
- URL
````
http://localhost:3000/jobs
````
- Request method
```
Post
```
- sample Payload
```
{
    "job": {
        "name": "first job",
        "address": "Jack Horsey 123 Fake Street Sacramento, CA",
        "description": "test"
    }
}
```
- above will return created jobs record
- To create estimates
- URL
````
http://localhost:3000/jobs/1/estimates
````
- Request method
```
Post
```
- sample Payload
```
{
    "estimate": {
        "name": "Expert Pavers",
        "description": "Job number: 2022",
        "estimate_details_attributes": [
          {
          "job": "Digout",
          "units": 3,
          "time": 3,
          "rate": 40,
          "cost": 20,
          "margin_multiple": 1.2,
          "estimate_category": "labour",
          "unit_of_measure": "hrs"
          },
          {
          "job": "Asphalt",
          "units": 3,
          "rate": 40,
          "cost": 20,
          "estimate_category_id": 1,
          "margin_multiple": 1.2,
          "estimate_category": "Materials",
          "unit_of_measure": "tonne"
          }
        ]
    }
}
```
- To update estimate, id property should be for estimate and estimate_details if id is not given for estimate_details new estimate details will be created.
- URL
````
http://localhost:3000/jobs/1/estimates/1
````
- Request method
```
Patch
```
- sample Payload
```
{
    "estimate": {
        "name": "Expert Pavers",
        "description": "Job number: 2022",
        "estimate_details_attributes": [
          {
          "id":1,
          "job": "Digout",
          "units": 4,
          "time": 5,
          "rate": 5,
          "cost": 5
          },
          {
          "id":2,
          "job": "Asphalt",
          "units": 5,
          "rate": 20,
          "cost": 10,
          "estimate_category_id": 1
          }
        ]
    }
}
```
- To get all estimates for a job
- URL
````
http://localhost:3000/jobs/1/estimates
````
- Request method
```
Get
```
- To get one estimates for a job
- URL
````
http://localhost:3000/jobs/1/estimates/1
````
- Request method
```
Get
```

- To delete estimates
- URL
````
http://localhost:3000/jobs/1/estimates/1
````
- Request method
```
Delete
```
