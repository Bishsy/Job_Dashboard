class MainController < ApplicationController
    def index
        @jseeker = Jseeker.find_by(id:session[:jseeker_id])
        @user = User.find_by(id:session[:user_id])
        if @jseeker
            redirect_to jseeker_path(@jseeker)
        elsif @user
            redirect_to user_path(@user)
        else
        end
    end

end