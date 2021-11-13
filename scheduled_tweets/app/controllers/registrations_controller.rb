class RegistrationsController < ApplicationController
    def new
        @user =User.new
    end

    def create
        #params
     #  @user= User.new(params[:user])
      # User.new(email: "bob@bob", password: "password")
       # render plain: params[:user] 
        @user = User.new(user_params)
        if @user.save
            session[:user_id]=@user.id
            redirect_to root_path, notice: "Succesfully created"
        else  
            render :new
        end
    end
    private

    def user_params
        params.require(:user).permit(:email,:password,:password_confirmation)
    end


end