class Sessions1Controller < ApplicationController

    def new
        if Jseeker.find_by(id:session[:jseeker_id])
            redirect_to jseeker_path(@jseeker)
        end
    end

    def create
        
        
        #jseeker=Jseeker.find_by(email: params[:email])
        jseeker=Jseeker.find_by(mobile: params[:mobile])

        if jseeker.present? && jseeker.authenticate(params[:password])
            session[:jseeker_id]=jseeker.id
            @jseeker=jseeker.id
            redirect_to jseeker_path(@jseeker), notice: "logged in successfully"
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
    
    end



   def destroy
    session[:jseeker_id]= nil
    redirect_to root_path, notice: "Logged out"
   end
   
end