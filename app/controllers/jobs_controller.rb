class JobsController < ApplicationController
    def show
        @user = User.find(params[:user_id])
        #@job=@user.jobs.find_by(params[:id])
        @job= Job.find(params[:id])
        Current.jseeker = Jseeker.find_by(id:session[:jseeker_id])
        if Current.jseeker
          @jseeker = Jseeker.find(session[:jseeker_id])
        end
        Current.user = User.find_by(id:session[:user_id])
        if Current.user
        @a = AppliedFor.where(job_id: @job.id)
        @js = []
        @a.each do |b|
            tjs = Jseeker.where(id: b.jseeker_id)
            @js += tjs if tjs
        end
        
      end  
    end
    

    def create
        @user = User.find(params[:user_id])
        @job = @user.jobs.new(job_params)
        if @job.save
          redirect_to user_path(@user), notice: "successfully created"
        else
          render :index
        end
    end
    def destroy
      @job = Job.find(params[:id])
      @job.destroy
      @user = User.find(session[:user_id])

      redirect_to user_path(@user), notice: "successfully deleted"
    end
    
      private
        def job_params
          params.require(:job).permit(:job_title, :job_des,:job_percat )
        end
    
end