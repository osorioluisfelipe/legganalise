class SampleAnalysesController < ApplicationController
  before_action :set_sample

  def new
    @sample_analysis = SampleAnalysis.new
  end

  def create
    @sample = Sample.find(params[:sample_id])
    @lab_analyses = LabAnalysis.where(id: params[:sample_analysis][:lab_analysis])
    @lab_analyses.each do |analysis|
      sample_analysis = SampleAnalysis.new(sample: @sample, lab_analysis: analysis)
      sample_analysis.save
    end
    redirect_to requests_path
  end

  private

  def set_sample
    @sample = Sample.find(params[:sample_id])
  end
end
