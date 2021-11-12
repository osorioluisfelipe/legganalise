class SamplesController < ApplicationController
  def index
    @samples = Sample.all
  end

  def show
    @sample = Sample.find(params[:id])
  end

  def create
    @request = Request.find(params[:request_id])
    @sample = Sample.new(sample_params)
    @sample.request = @request
    if @sample.save
      redirect_to request_path(@request), notice: 'Amostra adicionada com sucesso!'
    else
      flash[:error] = "Something went wrong"
      render "requests/show"
    end
  end

  def destroy
    @sample = Sample.find(params[:id])
    request = @sample.request
    @sample.destroy
    redirect_to request_path(request), notice: 'Amostra deletada com sucesso!'
  end

  def edit
    @sample = Sample.find(params[:id])
  end

  def update
    @sample = Sample.find(params[:id])
    @sample.update(sample_params)
    redirect_to request_path(@sample.request), notice: 'sample was successfully edited'
  end

  private

  def sample_params
    params.require(:sample).permit(:sample_name, :sample_matrix, :sample_type)
  end

end
