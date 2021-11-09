class LabAnalysisController < ApplicationController
  def index
    @analysis = LabAnalysis.all
  end
  def new
    @lab_analysis = LabAnalysis.new
  end

  def create
    @lab_analysis = LabAnalysis.new(analysis_params)
  end

  private

  def analysis_params
    params.require(:lab_analysis).permit(:analysis_name)
  end
end
