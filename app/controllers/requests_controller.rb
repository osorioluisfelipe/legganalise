class RequestsController < ApplicationController
  before_action :set_request, except: %I[index new create]
  def index
    if params[:query].present?
      if Request.global_search(params[:query]).first.nil?
        @requests = ""
      else
        @requests = policy_scope(Request).global_search(params[:query])
      end
    else
      @requests = policy_scope(Request).order(created_at: :desc)
    end
  end

  def show
    @sample = Sample.new
    authorize @request
  end

  def new
    @request = Request.new
    authorize @request
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    authorize @request
    if @request.save
      redirect_to request_path(@request), notice: "Solicitação criada com sucesso!"
    else
      render :new
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_path, notice: "Solicitação excluída com sucesso!"
  end

  def update
    if @request.request_approval
      if @request.entry_approval && @request.results_ready
        @request.results_approval = true
      else
        @request.entry_approval = true
      end
    else
      @request.request_approval = true
    end

    authorize @request
    save(@request)
  end

  def upload
    unless params[:request][:result].nil?
      @request.result.attach(params[:request][:result])
      @request.results_ready = true
    end

    authorize @request
    save(@request)
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def save(request)
    if request.save!
      redirect_to request_path(request)
    else
      render "requests/:id"
    end
  end

  def request_params
    params.require(:request).permit(:sample_quantity, :request_date, :project_name, :project_summary, :result)
  end
end
