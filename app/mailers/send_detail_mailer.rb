class SendDetailMailer < ApplicationMailer
	def submission
    @user = params[:user]
    mail(to: "bhavin.dhamecha@softices.com", subject: 'Detail of Laptop')
  end
end
