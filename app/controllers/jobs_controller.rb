class JobsController < ApplicationController
  def index
  end

  def create
    Resque.enqueue(WriteToDatabaseJob)
    redirect_to jobs_path
  end
end
