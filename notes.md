#Rails HTML-producing back end AND an API

## Setting up the base

- Rails [set up](https://joesasson.github.io/2017/03/24/setting-up-a-rails-app-with-rspec-and-postgres.html)

  `rails new app-name -T -d postgresql`

- Then create the database with: `rake db:create`

## Creating the model

- Create the kitten model with this command: `rails generate model kitten`
- I realized that should have passed the parameters through in the command so I deleted the model and used `rails generate model Kitten name:string age:integer cuteness:string softness:string --force` to replace the migration and generate a new model, the `--force` replaced the migration, as it was early on I thought it was ok to do a straight replacement.
- Could have used `rails destroy` command perhaps?

## Routes

- Set the default route to be the kittens page with `root 'kittens#index'`
- I added `resources :kittens` to the routes.rb file in config to create all the routing as per [Restful routes](https://www.theodinproject.com/courses/ruby-on-rails/lessons/routing#the-rails-way-to-write-restful-routes)

## Controller

- I added the controller with `rails generate controller Kittens` command
- In the newly created controller file, I added:

```
  def index
  end
```

It now is hooked up but needs the view to render.

## Creating an index view page

- I used the structure of the blog app project to create a simple kitten table.
- I got an error that seemed like @kittens class was not defined, when looking back at my blog app I realized that I created a variable `@articles` to hold reference to ALL articles, I replicated that here and that worked

```ruby
class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end
end
```

## Seeding the db

- I didn't have any kittens to display so I created 3 kittens in the seeds.db file then ran `rake db:seed` and the data was input into the db, kittens looked as follows:

```ruby
kitten1 = Kitten.create(name: 'Bob', age: 1, cuteness: 'So cute', softness: 'very')
```

That all got the `index` up and running!

## Show

- I added this to the kitten controller:
  ```ruby
    def show
      @kittens = Kitten.find(params[:id])
    end
  ```
- The url `http://localhost:3000/kittens/1` should point to the first kitten but we need to set up the view for that.
