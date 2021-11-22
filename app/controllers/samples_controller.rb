class SamplesController < ApplicationController
  before_action :set_sample, except: :create

  def show
    authorize @sample
  end

  def create
    @request = Request.find(params[:request_id])
    @sample = Sample.new(sample_params)
    @sample.request = @request

    authorize @sample

    if @sample.save
      redirect_to request_path(@request), notice: 'Amostra adicionada com sucesso!'
    else
      flash[:error] = "Something went wrong"
      render "requests/show"
    end
  end

  def destroy
    request = @sample.request

    authorize @sample

    @sample.destroy
    redirect_to request_path(request), notice: 'Amostra deletada com sucesso!'
  end

  def edit
    authorize @sample
  end

  def update
    authorize @sample
    @sample.update(sample_params)
    redirect_to request_path(@sample.request), notice: 'sample was successfully edited'
  end

  private

  def set_sample
    @sample = Sample.find(params[:id])
  end

  def sample_params
    params.require(:sample).permit(:sample_name, :sample_matrix, :sample_type)
  end
end
