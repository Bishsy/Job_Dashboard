class MainController < ApplicationController
    def index
        @jseeker = Jseeker.find_by(id:session[:jseeker_id])
        @user = User.find_by(id:session[:user_id])
        if @jseeker
            if @jseeker.verified
            redirect_to jseeker_path(@jseeker)
            else
                session[:jseeker_id] = nil
                redirect_to root_path, notice: "Logged out"
            end
        elsif @user
            if @user.verified
            redirect_to user_path(@user)
            else
                session[:user_id]= nil
                redirect_to root_path, notice: "Logged out"
            end
        else
            
        end
    end

end