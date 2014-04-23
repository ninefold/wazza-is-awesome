class JobsController < ApplicationController
  def index
  end

  def create
    Resque.enqueue(WriteToDatabaseJob)
    redirect_to jobs_path
  end

  def env_vars
    Resque.enqueue(PrintEnvVarsJob)
    redirect_to jobs_path, notice: "Env vars printed."
  end

end
