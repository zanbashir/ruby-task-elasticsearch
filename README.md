# Elasticsearch-Challenge
Elasticsearch Challenge server-side codebase

## Prerequisites
* Ruby v2.6.6
* Postgres
* ElasticSearch
    - For mac just execute `brew install elasticsearch`.
      See the [reference](https://www.elastic.co/downloads/elasticsearch)

## Installing

1. Setup new rvm for ruby 2.6.6
2. Install bundler
3. Setup database according to `config/database.example.yml`
4. Set ENV variables in `.env` file. See `.env.template` file
4. Run `rake db:create db:migrate db:seed` to setup the project and initialize all required data

## Debugging
* If you're using local ruby environment you can use `binding.pry` inside the code or use RubyMine debugger
* If you're using Docker see [this reference](https://medium.com/@GrantMercer/debugging-rails-on-docker-with-vscode-6f9d920413fd)
* You can also use `puts` and `p` commands

## Devise
* Create new User http://localhost:3000/users/sign_up
* Sign In to Existing http://localhost:3000/users/sign_in

## Doorkeeper
Get familiar with Doorkeeper from [this reference](https://doorkeeper.gitbook.io/guides/ruby-on-rails/getting-started)

* Mange Application
http://localhost:3000/oauth/applications

## Test Client and API with oauth2
1. Create a New Application
2. Define Call Backs while creating Application
3. Open Terminal and create test client using oauth2 

4. Copy Past follwing code and change client id and secret.
```
require 'oauth2'
client_id = "HZtdjs6elq7JWrT4FvvgcSsgIDSNpjK7NJpbyIsEUg0"
client_secret = "teQELRHun5LExDRMcP1jF_Y2Obom0_o4kFnS4YS1wiY"
call_back =  'http://localhost:3001/auth/todo/callback'

client = OAuth2::Client.new(client_id, client_secret, :site => 'http://localhost:3000')
client.auth_code.authorize_url(:redirect_uri => call_back)
```

5. Copy link from above output it should be like this:
http://localhost:3000/oauth/authorize?client_id=HZtdjs6elq7JWrT4FvvgcSsgIDSNpjK7NJpbyIsEUg0&redirect_uri=http%3A%2F%2Flocalhost%3A3001%2Fauth%2Ftodo%2Fcallback&response_type=code

6. Hit to the Browser 
then it will redirect with url like this
   http://localhost:3001/auth/todo/callback?code=AC8DnrXk4Kwg1AXQgpEiMTy4bzLxZBLAHA4fSiGqUe8

7. Now Get access token using code from step 6
Request for Token
```
token = 'AC8DnrXk4Kwg1AXQgpEiMTy4bzLxZBLAHA4fSiGqUe8'
access = client.auth_code.get_token(token, redirect_uri: call_back)
```
8. get the token access token and pass it into API
```
access.token
"1S1OZk8hXDin2Ko2Lb34-fqBgIIERWUtwu8wdYdU6vA" 
```
9. Call the API Like this
```bigquery
GET http://localhost:3000/api/v1/verticals?access_token=1S1OZk8hXDin2Ko2Lb34-fqBgIIERWUtwu8wdYdU6vA
```

## Postman Collection
1. Import the Postman Collection using follwing link 
https://www.getpostman.com/collections/52e790b350cc9abd9f33
2. Chose Oauth2 and set Set Access in above step.