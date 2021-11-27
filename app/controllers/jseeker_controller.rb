class JseekerController < ApplicationController
    before_action :set_client, only: [:create, :verify]
    before_action :verified_jseeker!, only: [:status, :show]
    def index
        @jseeker =Jseeker.new
    end

    def create
        #params
     #  @user= User.new(params[:user])
      # User.new(email: "bob@bob", password: "password")
       # render plain: params[:user] 
       channel = jseeker_params['channel']
        @jseeker = Jseeker.new(jseeker_params.except('channel', 'displayed_phone_number'))
        if @jseeker.save
            start_verification(@jseeker.mobile, channel)
            session[:jseeker_id]=@jseeker.id
            @jseeker = @jseeker.id
            redirect_to verifyjseeker_url(@jseeker), notice: "Succesfully created"
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

    def verify
        @jseeker=Jseeker.find(params[:id])
        if request.post?
            @jseeker=Jseeker.find(params[:id])
            is_verified = check_verification(@jseeker.mobile, params['verification_code'])
            if is_verified
                @jseeker.verified = true
                @jseeker.save
                respond_to do |format|
                  format.html { redirect_to jseeker_path(@jseeker), notice: 'User was successfully verified.' }
                end
            else
                respond_to do |format|
                  format.html { redirect_to verifyjseeker_url(@jseeker), notice: 'The code was invalid.' }
                end
            end
        else
        end
    end

    def show
        @jobs = Job.all
        @jseeker = Jseeker.find(params[:id])
        render :dashboard
    end

    private
    def set_user
        @user = User.find(params[:id])
      end
  
      def set_client
        @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
      end
    
    def jseeker_params
        params.require(:jseeker).permit(:name, :email, :mobile, :percentage ,:password, :password_confirmation,:qdegree,:jdes)
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
