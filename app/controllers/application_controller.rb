class ApplicationController < ActionController::Base
    before_action :set_current_user
    
    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id:session[:user_id])
        end

    end
    
    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You must signed in to do that." if Current.user.nil?
    end
    before_action :set_current_jseeker
    def set_current_jseeker
        if session[:jseeker_id]
            Current.jseeker = Jseeker.find_by(id:session[:jseeker_id])
        end

    end
    
    def require_jseeker_logged_in!
        redirect_to sign_in1_path, alert: "You must signed in to do that." if Current.jseeker.nil?
    end

end
