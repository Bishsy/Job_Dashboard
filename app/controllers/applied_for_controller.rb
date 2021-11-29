class AppliedForController < ApplicationController
    def index
        @applied_for = AppliedFor.new
    end
    def new
        @applied_for = AppliedFor.new
        @job=Job.find(params[:job_id])
    end
    def create
        @jseeker = Jseeker.find(session[:jseeker_id])
        
        @job=Job.find(params[:id])

        if AppliedFor.where(jseeker_id:@jseeker.id, job_id:@job).present?
            redirect_to jseeker_path(@jseeker), notice: "Already Applied"
        else
            @a = AppliedFor.new(job_id: @job.id, jseeker_id:@jseeker.id ,status: "1")
            if @a.save
                redirect_to jseeker_path(@jseeker), notice: "Applied successfully"
            else
            
                # redirect_to user_job_path(@user,@job)
                render :index 
            end
        end
    end

    def edit 
        @job = Job.find(params[:job_id])
        @user = User.find(session[:user_id])
        @applied_for = AppliedFor.find(params[:id])
        @applied_for.status = "2"
        if @applied_for.save
            redirect_to user_job_path(@user.id,@job.id),  notice: "JobSeeker Accepted"
            
        else
            render :index
        end
    end

    def show
        @job = Job.find(params[:job_id])
        @user = User.find(session[:user_id])
        @applied_for = AppliedFor.find(params[:id])
        @applied_for.status = "3"
        if @applied_for.save
            redirect_to user_job_path(@user.id,@job.id),  notice: "JobSeeker Rejected"
        else
            render :index
        end
    end
end