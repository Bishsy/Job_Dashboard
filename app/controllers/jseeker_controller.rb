class JseekerController < ApplicationController
    def index
        @jseeker =Jseeker.new
    end

    def create
        #params
     #  @user= User.new(params[:user])
      # User.new(email: "bob@bob", password: "password")
       # render plain: params[:user] 
        @jseeker = Jseeker.new(jseeker_params)
        if @jseeker.save
            session[:jseeker_id]=@jseeker.id
            redirect_to jseeker_path(@jseeker.id), notice: "Succesfully created"
        else  
            render :index
        end
    end

    def status
        @jseeker = Jseeker.find(session[:jseeker_id])
        @a = AppliedFor.where(jseeker_id: @jseeker.id)
        @job = []
        @a.each do |b|
            tjob = Job.where(id: b.job_id)
            @job += tjob if tjob
        end 
    end

    def show
        @jobs = Job.all
        @jseeker = Jseeker.find(params[:id])
        render :dashboard
    end

    private

    
    def jseeker_params
        params.require(:jseeker).permit(:name, :email, :mobile, :percentage ,:password, :password_confirmation,:qdegree,:jdes)
    end
end
