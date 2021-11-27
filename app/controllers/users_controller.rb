class UsersController < ApplicationController
    before_action :set_client, only: [:create, :verify]
    before_action :verified_user!, only: [:show]

    def index
        @user =User.new
    end

    def show
        @user=User.find(params[:id])
        @job = Job.where(user_id: @user.id).count
        
    end

    def create
        channel = user_params['channel']
        #params
     #  @user= User.new(params[:user])
      # User.new(email: "bob@bob", password: "password")
       # render plain: params[:user] 
       @user = User.new(user_params.except('channel', 'displayed_phone_number'))
        if @user.save
            start_verification(@user.mobileno, channel)
            session[:user_id]=@user.id
            @user = @user.id
            redirect_to verifyuser_url(@user), notice: "Succesfully created"
        else  
            render :index
        end
    end

    def verify
        @user=User.find(params[:id])
        if request.post?
          is_verified = check_verification(@user.mobileno, params['verification_code'])
          if is_verified
            @user.verified = true
            @user.save
            respond_to do |format|
              format.html { redirect_to @user, notice: 'User was successfully verified.' }
            end
          else
            respond_to do |format|
              format.html { redirect_to verifyuser_url(@user), notice: 'The code was invalid.' }
            end
          end
        else
        end
    end

    private
    def set_user
        @user = User.find(params[:id])
      end
  
    def set_client
        @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    end

    def user_params
        params.require(:user).permit(:email, :cname, :cinumber, :mobileno,:password,:password_confirmation)
    end

    def start_verification(to, channel='sms')
        channel = 'sms' unless ['sms', 'voice'].include? channel
        verification = @client.verify.services(ENV['VERIFICATION_SID'])
                                     .verifications
                                     .create(:to => to, :channel => channel)
        return verification.sid
    end
  
    def check_verification(phone, code)
        verification_check = @client.verify.services(ENV['VERIFICATION_SID'])
                                           .verification_checks
                                           .create(:to => phone, :code => code)
        return verification_check.status == 'approved'
    end



end