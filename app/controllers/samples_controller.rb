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
    raise
    @sample.user = current_user
    if @sample.save
      redirect_to sample_path(@sample), notice: 'sample was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @sample = Sample.find(params[:id])
    @sample.destroy
    redirect_to samples_path, notice: 'sample was successfully destroyed'
  end

  def edit
    @sample = Sample.find(params[:id])
  end

  def update
    @sample = Sample.find(params[:id])
    @sample.update(sample_params)
    redirect_to sample_path(@sample)
  end

  private

  def sample_params
    params.require(:sample).permit(:sample_name, :sample_matrix, :sample_type, :analysis)
  end

end
