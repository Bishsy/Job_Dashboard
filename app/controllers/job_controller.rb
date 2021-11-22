class JobController < ApplicationController
    def show
        @user = User.find_by(params[:user_id])
        @job=@user.jobs.find_by(params[:id])
        
    end
    
end