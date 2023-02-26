**Environment**
|  |  |
|--|--|
| Rails version | 7.0.4.2  |
| Ruby version | 2.7.6  |
| Database | sqlite3  |
| Testing Framework | RSpec  |

**Clone The Repository**
```
git clone https://github.com/ripan/reedsy-challenge-backend.git
```

**Running BE API** 
```
- cd reedsy-challenge-backend
- rails db:create db:migrate db:seed
- rails s
```

- API URL: http://localhost:3000

**Running RSpec** 
```
- cd reedsy-challenge-backend
- RAILS_ENV=test rspec spec
```

**API: List Items** 

```
curl --location 'http://localhost:3000/api/v1/items'
```

**API: Update price of given item**
```
curl --location --request PATCH 'http://localhost:3000/api/v1/items/MUG' \
--header 'Content-Type: application/json' \
--data '{
    "price": 40.9
}'
```

**API: Check price of given items**
```
curl --location 'http://localhost:3000/api/v1/cart' \
--header 'Content-Type: application/json' \
--data '{
    "items": [
        {
            "code": "MUG",
            "quantity": 1
        },
        {
            "code": "TSHIRT",
            "quantity": 1
        },
        {
            "code": "HOODIE",
            "quantity": 1
        }
    ]
}'
```

```
curl --location 'http://localhost:3000/api/v1/cart' \
--header 'Content-Type: application/json' \
--data '{
  "items": [
    {
      "code": "MUG",
      "quantity": 2
    },
    {
      "code": "TSHIRT",
      "quantity": 1
    }
  ]
}'
```

```
curl --location 'http://localhost:3000/api/v1/cart' \
--header 'Content-Type: application/json' \
--data '{
  "items": [
    {
      "code": "MUG",
      "quantity": 3
    },
    {
      "code": "TSHIRT",
      "quantity": 1
    }
  ]
}'
```

```
curl --location 'http://localhost:3000/api/v1/cart' \
--header 'Content-Type: application/json' \
--data '{
  "items": [
    {
      "code": "MUG",
      "quantity": 2
    },
    {
      "code": "TSHIRT",
      "quantity": 4
    },
    {
      "code": "HOODIE",
      "quantity": 1
    }
  ]
}'
```

**API: Check discounted price of given items**

```
curl --location 'http://localhost:3000/api/v1/cart' \
--header 'Content-Type: application/json' \
--data '{
  "items": [
    {
      "code": "MUG",
      "quantity": 9
    },
    {
      "code": "TSHIRT",
      "quantity": 1
    }
  ]
}
'
```

```
curl --location 'http://localhost:3000/api/v1/cart' \
--header 'Content-Type: application/json' \
--data '{
  "items": [
    {
      "code": "MUG",
      "quantity": 10
    },
    {
      "code": "TSHIRT",
      "quantity": 1
    }
  ]
}
'
```

```
curl --location 'http://localhost:3000/api/v1/cart' \
--header 'Content-Type: application/json' \
--data '{
  "items": [
    {
      "code": "MUG",
      "quantity": 45
    },
    {
      "code": "TSHIRT",
      "quantity": 3
    }
  ]
}'
```

```
curl --location 'http://localhost:3000/api/v1/cart' \
--header 'Content-Type: application/json' \
--data '{
    "items": [
        {
            "code": "MUG",
            "quantity": 200
        },
        {
            "code": "TSHIRT",
            "quantity": 4
        },
        {
            "code": "HOODIE",
            "quantity": 1
        }
    ]
}'
```