# Link Shortener API

## README
The intention of this code is to create an API used to shorten URL's. 

## Installation Instruction

First make sure you have the following installed:
- Rails 6 
- ruby 2.6.3p62

## Tests 
The code uses the RSpec testing framework, to run the test use the following command:

```
rspec
```

## Give it a try!
The API can be tested usingn the command line using the following curl requests:

UPDATE:
```
curl -X PUT -d 'status=true' http://localhost:3000/v1/links/7
```

SHOW
```
curl http://localhost:3000/v1/links/8
```

INDEX
```
curl http://localhost:3000/v1/links/
```

DELETE
```
curl -X DELETE http://localhost:3000/v1/links/4
```
CREATE
```
curl -d 'original_url=http://www.google.com&slug=myslug' http://localhost:3000/v1/links/
```

## Future Enhancements:

- Add Regular expression to validate URL.
- Increment the number of test cases.
- Limit the number of chars in the slug?
