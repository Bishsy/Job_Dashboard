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

    def show
    
        render :dashboard
    end
    private

    
    def jseeker_params
        params.require(:jseeker).permit(:name, :email, :mobile, :percentage ,:password, :password_confirmation)
    end
end
