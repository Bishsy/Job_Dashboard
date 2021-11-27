class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :set_current_jseeker
    
    def set_current_user
        if session[:user_id]
            @user = User.find_by(id:session[:user_id])
            Current.user = User.find_by(id:session[:user_id])
        end
    end
    
    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You must signed in to do that." if Current.user.nil?
    end
    def verified_user!
        redirect_to verifyuser_path(@user),alert: "You must verified in to do that." if !Current.user.verified
    end
    before_action :set_current_jseeker
    def set_current_jseeker
        if session[:jseeker_id]
            @jseeker = Jseeker.find_by(id:session[:jseeker_id])
            Current.jseeker = Jseeker.find_by(id:session[:jseeker_id])
        end

    end
    
    def require_jseeker_logged_in!
        redirect_to sign_in1_path, alert: "You must signed in to do that." if Current.jseeker.nil?
    end
    def verified_jseeker!
        redirect_to verifyjseeker_path(@jseeker),alert: "You must verified in to do that." if !Current.jseeker.verified
    end

end
