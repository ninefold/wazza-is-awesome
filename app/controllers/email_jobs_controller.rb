class EmailJobsController < ApplicationController
  def create
    email = params[:email] || "shaun@ninefold.com"
    Resque.enqueue(BackgroundEmailJob, email)
    respond_to do |format|
      format.html { redirect_to(jobs_path, notice: "Email was sent to: #{email}.") }
      format.json { render json: @jobs }
    end
  end
end
