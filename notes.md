# Rails HTML-producing back end AND an API

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

- Created a page for show but realized that I could probably make the info more efficient. This was harder than anticipated and I started diving into the world of hashes.
- I created a private section in my controller to hold the pulling of data from the db but I need ot do more work to understand how to map over the data as I don't think I quite have that logic down yet.

### Pluralize

```ruby
 <p><%= @kitten.name %> is <%= pluralize(@kitten.age, "year")%> old!</p>
```

## New and Create

- New is kind of like the view and create is the action that pushes the change to the db same with edit and update

### Delete

- This wasn't working as shown in the tutorial, I think it was because I was using the `before_action` so I read that wrapping the redirect in a format might help and it did seem to do the trick.

```ruby
    respond_to do |format|
      format.html { redirect_to kittens_path }
    end
```

### Flash

- I have a few flashes working now and they render in the layout `application.html.erb` file. They do not however seem to disappear. I might need to add functionality to click to dismiss.

## Bootstrap vs tachyons

- I originally tried tachyons however I felt that the fewer classes of bootstrap might work better for getting the erb fields set up. I think with tachyons you'd want to create each component and import it in which is great however for this project I just want to get some basic styling set up.

- Will explore Tachyons more though as I really like that system.

- Set up bootstrap using this tutorial [Rails and Bootstrap](https://medium.com/@biancapower/how-to-add-bootstrap-4-to-a-rails-5-app-650118459a1e)
- I was struggling to get it to work so installed bootstrap via yarn [Use yarn to add Bootstrap](https://www.mashrurhossain.com/blog/rails6bootstrap4)

- This method got the JS to work.

-
