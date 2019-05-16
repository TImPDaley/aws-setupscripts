# to add users to a rails application
#

#First Generate Scaffold or Users

rails generate scaffold user password_digest:string firstname:string lastname:string middlename:string email:string:index:uniq cellphonenumber:string address1:string address2:string address3:string city:string state:string zipcode:string picture:string remember_digest:string reset_digest:string activation_digest:string admin:boolean activated:boolean activated_at:datetime reset_sent_at:datetime

#edit migration add unique index and default values 

rails db:migrate

# Copy users_controller, account_activations_controller, sessions_controller, password_resets_controller, and visitors_controller to app/controllers

# update application_controller.rb in app/contorllers

# Copy models files - user.rb to app/models

# copy  sessions_helper.rb to app/helpers

# copy user_mailer.rb to app/mailers

# copy application.html.erb into app/views
# copy all the partials from views to app/views/layouts (messages navigation... footer etc)

# copy routes.rb to config/routes.rb

#copy seeds.rb to db/seeds.rb

# run db migrate
rails db:migrate
rails db:seeds

# Create a new Run configuration command:rails server -p $PORT -b $IP
