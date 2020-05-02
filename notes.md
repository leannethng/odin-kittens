#Rails HTML-producing back end AND an API

- Rails [set up](https://joesasson.github.io/2017/03/24/setting-up-a-rails-app-with-rspec-and-postgres.html)

  `rails new app-name -T -d postgresql`

- Then create the database with: `rake db:create`

- Create the kitten model: `rails generate model kitten`
- I realized that should have passed the parameters through in the command so I deleted the model and used `rails generate model Kitten name:string age:integer cuteness:string softness:string --force` to replace the migration and generate a new model, the `--force` replaced the migration, as it was early on I thought it was ok to do a straight replacement.
-
