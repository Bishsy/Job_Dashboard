class AppliedForsController < ApplicationController
    def index
        @applied_for = AppliedFor.new
    end
    def create
        @applied_for = AppliedFor.create(applied_for_params)
        if @applied_for.save
            redirect_to jseeker_path(@jseeker), notice: "Applied successfully"
        else
            render :new
        end
    end
    private
    def applied_for_params
      params.require(:applied_for).permit(:status, :job_id, :jseeker_id)
    end
end