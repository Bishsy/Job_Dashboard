class Password1Mailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    @token = params[:jseeker].signed_id(purpose: "password_resets1", expires_in: 15.minutes)

    mail to: params[:jseeker].email
  end
end
