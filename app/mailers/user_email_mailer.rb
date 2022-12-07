class UserEmailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_email_mailer.login.subject
  #
  def login(user)
    @message = "You have successfully Loged in E-commerce app"
    @user=user
    mail to: @user, subject: "welcome #{@user}"
  end
end
