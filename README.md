# Link Shortener API

## README
The intention of this code is to create an API used to shorten URL's. 

## Installation Instruction

1. Make sure you have rails 6 installed:
```
rails -v
```
  * if not installed run: sudo gem install rails

2. Run the following command to install required gems:
```
bundle install
```

3. Run migrations to create table (I didnt include any seeds)
```
rails db:migrate
```

4. Now you are ready to go! just start the rails web server:
```
rails s
```

## Tests 
The code uses the RSpec testing framework, to run the test use the following command:

```
rspec
```

## Give it a try!
The API can be tested usingn the command line using the following curl requests:

CREATE
```
curl -d 'original_url=http://www.google.com&slug=myslug' http://localhost:3000/v1/links/
```

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


## Future Enhancements:

- Add Regular expression to validate URL.
- Increment the number of test cases.
- Limit the number of chars in the slug?
