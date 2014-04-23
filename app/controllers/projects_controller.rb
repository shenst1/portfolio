class Api::ProjectsController < Api::BaseController

  def index
    render json: Project.all
  end

  def show
    render json: project
  end

  def create
    project = Project.create!(safe_params)
    render json: project
  end

  def update
    render :json =>  Project.update(safe_params[:id], safe_params)
  end

  def destroy
    render :json =>  Project.destroy(params[:id])
  end


  private

  def safe_params
    params.require(:project).permit(:title, :about, :url, :image_url, :tools, :feedback)
  end
  def project
    @project ||= Project.find(params[:id])
  end

end

