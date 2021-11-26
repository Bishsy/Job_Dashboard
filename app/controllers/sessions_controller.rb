class SessionsController < ApplicationController

    def new

    end

    def create
        #user=User.find_by(email: params[:email])
        user=User.find_by(mobileno: params[:mobileno])

        if user.present? && user.authenticate(params[:password])
            session[:user_id]=user.id
            @user = user.id
            redirect_to user_path(@user), notice: "logged in successfully"
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
    end

   def destroy
    session[:user_id]= nil
    redirect_to root_path, notice: "Logged out"
   end
   
end