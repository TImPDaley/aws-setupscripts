
# SET UP of Environment 
# SCRIPT COMMANDS ### start after $xxxxxx


# Check Ubuntu version 
$lsb_release -a

# Check what version of node and node package manager you have... 
$node -v
$npm -v 
# Install Node.js or update it .. 
# $sudo apt-get install nodejs

$ruby -v

# See what gems are install in the "global" gemset
$rvm gemset use global

$gem list
$gem outdated 
# THis will show what needs updating... 
# Update the gems... 
$gem update --system
# UPDATES all gems ... overwrite executable for bundler if asked

$rvm gemset use default

$rails -v

# INSTALL RAILS latest version 
$gem install rails


# Install Heroku Tool belt
$sudo snap install --classic heroku

# INSTALL Postgresql postgres database on system 
# THis will install postgresql .. hit return to take defaults
$sudo apt-get install postgresql postgresql-contrib libpq-dev pgadmin3

$sudo su - postgres
    psql
    \du
    CREATE USER ubuntu WITH PASSWORD 'Kelley1960';
    ALTER USER ubuntu with SUPERUSER;
    \du
    # should show new user ubuntu ... with Superuser role
    
    \q # exits psql
    
$exit

# PULL DOWN AN APPLICATION FROM git hub and test it OR
# START NEW APPLICATION ==> by runnig script2

