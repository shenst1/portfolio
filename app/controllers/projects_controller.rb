class ProjectsController < ApplicationController
  respond_to :json

  def index
    render :json => Project.all
  end

  def show
    respond_with Project.find(params[:id])
  end

  def create
    render :json => Project.create!(safe_params)
  end

  def update
    render :json =>  Project.update(safe_params[:id], safe_params)
  end

  def destroy
    render :json =>  Project.destroy(params[:id])
  end


  private

  def safe_params
    params.require(:project).permit(:title, :about, :url, :tools, :feedback)
  end
end

