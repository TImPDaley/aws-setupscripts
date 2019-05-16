# PULL DOWN AN APPLICATION FROM git hub and test it OR
# START NEW APPLICATION ==> by runnig script2

# NOTE app-name should be changed to the NAME of your APPLICATION:
# Make sure you are in the top directory

$rails new app-name -T -d postgresql  
this skips the testing framework and configs for Postgresql

$cd app-name

EDIT Gemfile - add gem 'rspec-rails' to Gemfile in test and development group
app-name$bundle install

configure rspec in app
app-name$rails generate rspec:install

CREATE DATABASE 
app-name$rails db:create
app-name$rails db:migrate

UPDATE GIT  initial commit 
app-name$git add -A
app-name$git commit -m "Message for initial commit"

Set up on Heroku add application deploy - 

app-name$heroku login -i
 enter password and username for Heroku
 
NOW DEPLOY Application to Heroku 
app-name$heroku create

Test if app was created on Heroku 
app-name$git config --list | grep heroku
THIS SHOULD show remotes  etc. 

configure assest 

DEPLOY the application
app-name$ RAILS_ENV=prodcution rails assets:precompile
app-name$ git add -A
app-name$ git commit -m "message"
app-name$ git push heroku master

Migrate database
app-name$heroku run rake db:migrate


START BUILDING APPLICATION 
when you are ready to deploy
Run tests 
app-name$ rspec
app-name$ RAILS_ENV=production rails assets:precompile
app-name$ git push heroku master 

