class SamplesController < ApplicationController
  def index
    @samples = Sample.all
  end

  def show
    @sample = Sample.find(params[:id])
  end

  def new
    @sample = Sample.new
  end

  def create
    @sample = Sample.new(sample_params)
    @sample.user = current_user

    if @sample.save
      redirect_to @sample, notice: 'sample was successfully created.'
    else
      render :new
    end
  end

  private

  def sample_params
    params.require(:sample).permit(:sample_name, :sample_matrix, :sample_type)
  end

end
