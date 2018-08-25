class SendDetailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    SendDetailMailer.with(user: @user).submission.deliver
  end
end
