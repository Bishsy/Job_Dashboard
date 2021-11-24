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
            redirect_to jseeker_path(@jseeker), notice: @job.id
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
end