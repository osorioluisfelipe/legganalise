class RequestsController < ApplicationController
  def index
    if params[:query].present?
      if Request.search_by_project_name_and_project_summary(params[:query]).first.nil?
        @requests = ""
      else
        @requests = Request.search_by_project_name_and_project_summary(params[:query])
      end
    else
      @requests = Request.all
    end
  end

  def show
    @request = Request.find(params[:id])
    @sample = Sample.new
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    if @request.save
      redirect_to request_path(@request), notice: "Solicitação criada com sucesso!"
    else
      render :new
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    redirect_to requests_path, notice: "Solicitação excluída com sucesso!"
  end

  def update
    @request = Request.find(params[:id])
    @request.request_approval = true

    if @request.save!
      redirect_to request_path(@request), notice: "Solicitação enviada!"
    else
      render "requests/:id"
    end
  end

  def upload
    @request = Request.find(params[:id])
    unless params[:request][:result].nil?
      @request.result.attach(params[:request][:result])
      @request.results_ready = true
    end
    if @request.save!
      redirect_to request_path(@request)
    else
      render "requests/:id"
    end
  end

  private

  def request_params
    params.require(:request).permit(:sample_quantity, :request_date, :project_name, :project_summary, :result)
  end
end
