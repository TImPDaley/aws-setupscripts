class UserMailer < ApplicationMailer
  default from: "application@timpdaley.com"

  def account_activation(user)
    @user = user
    mail to: user.email, subject: 'Account activation for IEM Fellowships'
  end

  # Send an Email to reset the password
  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'Password reset'
  end

  # Send email from a user of the website...
  def visitor_email(visitor)
    @visitor = visitor
    mail(to: Rails.application.secrets.email_provider_username, from: @visitor.email, subject: 'Website Contact')
  end
  
  def activation_confirmation(user)
    @user = user
    mail to: user.email, subject: 'Account confirmation for IEM Fellowships'
  end
end