
SET UP of Environment 
SCRIPT COMMANDS ### start after $xxxxxx

Lets update the package manager....
$sudo apt-get update

Update the gems... 
$gem update --system

Install Node.js or update it .. 
$sudo apt-get install nodejs

INSTALL latest RUBY - 2.6.1 ... make it the default RVM environment
$rvm autolibs fail
$rvm install 2.6.1
 THIS takes about ten minutes to complete... 
$rvm --default use 2.6.1
$rvm list
    should show the current ruby environments ... lets get rid of ole 2.6.0 
$rvm uninstall 2.6.0 

Update UBUNTU
$sudo apt-get update
$sudo apt-get upgrade
$sudo apt autoremove

Check Ubuntu version 
$lsb_release -a

See what gems are install in the "global" gemset
$rvm gemset use global

$gem list
$gem outdated 
THis will show what needs updating... 
$gem update 
UPDATES all gems ... overwrite executable for bundler if asked

$rvm gemset use default

INSTALL RAILS latest version 
$gem install rails

rails  5.2.3
ruby 2.6.1

Install Heroku Tool belt
$sudo snap install --classic heroku

INSTALL Postgresql postgres database on system 

$sudo apt-get install postgresql postgresql-contrib libpq-dev pgadmin3
THis will install postgresql .. hit return to take defaults

$sudo su - postgres
    psql
    \du
    CREATE USER ubuntu WITH PASSWORD 'Kelley1960';
    ALTER USER ubuntu with SUPERUSER;
    \du
    # should show new user ubuntu ... with Superuser role
    
    \q # exits psql
    
$exit

PULL DOWN AN APPLICATION FROM git hub and test it .. 

START NEW APPLICATION ==> application name "carboard" can change to whatever you want: 
$rails new carboard -T -d postgresql  
this skips the testing framework and configs for Postgresql

$cd carboard

EDIT Gemfile - add gem 'rspec-rails' to Gemfile in test and development group
carboard$bundle install

configure rspec in app
carboard$rails generate rspec:install

CREATE DATABASE 
carboard$rails db:create
carboard$rails db:migrate

UPDATE GIT  initial commit 
carboard$git add -A
carboard$git commit -m "Message for initial commit"

Set up on Heroku add application deploy - 

carboard$heroku login -i
 enter password and username for Heroku
 
NOW DEPLOY Application to Heroku 
carboard$heroku create

Test if app was created on Heroku 
carboard$git config --list | grep heroku
THIS SHOULD show remotes  etc. 

configure assest 

DEPLOY the application
carboard$ RAILS_ENV=prodcution rails assets:precompile
carboard$ git add -A
carboard$ git commit -m "message"
carboard$ git push heroku master

Migrate database
carboard$heroku run rake db:migrate


START BUILDING APPLICATION 
when you are ready to deploy
Run tests 
carboard$ rspec
carboard$ RAILS_ENV=production rails assets:precompile
carboard$ git push heroku master 

