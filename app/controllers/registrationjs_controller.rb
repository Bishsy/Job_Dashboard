class RegistrationjsController < ApplicationController
    def new
        @jseeker =Jseeker.new
    end

    def create
        #params
     #  @user= User.new(params[:user])
      # User.new(email: "bob@bob", password: "password")
       # render plain: params[:user] 
        @jseeker = Jseeker.new(jseeker_params)
        if @jseeker.save
            session[:Jseeker_id]=@jseeker.id
            redirect_to root_path, notice: "Succesfully created"
        else  
            render :new
        end
    end
    private

    def jseeker_params
        params.require(:jseeker).permit(:name, :email, :mobile, :percentage ,:password, :password_confirmation)
    end


end