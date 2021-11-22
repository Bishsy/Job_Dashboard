class AppliedForsController < ApplicationController
    def new
        @applied_for = AppliedFor.new
    end
    def create
        @applied_for = AppliedFor.new(applied_for_params)
        if @applied_for.save
            redirect_to jseekerd_path, notice: "logged in successfully"
        else
            render :new
        end
    end
    private
    def applied_for_params
      params.require(:applied_for).permit()
    end
end