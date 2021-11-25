class UsersController < ApplicationController
    def index
        @user =User.new
    end

    def show
        @user=User.find(params[:id])
        @job = Job.where(user_id: @user.id).count
        
    end

    def create
        #params
     #  @user= User.new(params[:user])
      # User.new(email: "bob@bob", password: "password")
       # render plain: params[:user] 
        @user = User.new(user_params)
        if @user.save
            session[:user_id]=@user.id
            @user = @user.id
            redirect_to user_path(@user), notice: "Succesfully created"
        else  
            render :new
        end
    end
    private
   
    def user_params
        params.require(:user).permit(:email, :cname, :cinumber, :mobileno,:password,:password_confirmation)
    end


end