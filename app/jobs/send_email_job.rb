class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    @user=user
    UserEmailMailer.login(@user).deliver_now
    
  end
end
