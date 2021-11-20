class PasswordResets1Controller < ApplicationController
    def new 

    end

    def create 
        @jseeker = Jseeker.find_by(email: params[:email])

        if @jseeker.present?
            Password1Mailer.with(Jseeker: @jseeker).reset.deliver_now

        end
        redirect_to root_path, notice: "If an account with that email was found,we have to sent a link to reset your password"
        
    end

    def edit
        @jseeker = Jseeker.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in1_path, alert: "Your token has expired, Please try again."
    end

    def update
        @jseeker = Jseeker.find_signed!(params[:token], purpose: "password_reset")
        
        if @jseeker.update(password_params)
            redirect_to sign_in1_path, notice: "Your password was reset successfully, please sign in"

        else
            render:edit
        end
    end
    private

    def password_params
        params.require(:Jseeker).permit(:password, :password_confirmation)
    end

end