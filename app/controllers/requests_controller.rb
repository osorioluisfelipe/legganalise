class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user

    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    redirect_to requests_path
  end

  private

  def request_params
    params.require(:request).permit(:sample_quantity, :request_date, :project_name, :project_summary)
  end
end
