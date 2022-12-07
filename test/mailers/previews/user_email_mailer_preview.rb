# Preview all emails at http://localhost:3000/rails/mailers/user_email_mailer
class UserEmailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_email_mailer/login
  def login
    UserEmailMailer.login
  end

end
