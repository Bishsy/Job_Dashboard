class JobsController < ApplicationController
    def show
        @user = User.find_by(params[:user_id])
        @job=@user.jobs.find_by(params[:id])
        @jseeker = Jseeker.find(session[:jseeker_id])
        
    end
    def create
        @user = User.find(params[:user_id])
        @job = @user.jobs.create(job_params)
        redirect_to user_path(@user), notice: "successfully created"
      end
    
      private
        def job_params
          params.require(:job).permit(:job_title, :job_des,:job_percat )
        end
    
end