class SampleAnalysesController < ApplicationController
  before_action :set_sample

  def new
    @sample_analysis = SampleAnalysis.new
  end

  def create
    @sample = Sample.find(params[:sample_id])
    @lab_analyses = LabAnalysis.where(id: params[:sample_analysis][:lab_analysis_id])
    @lab_analyses.each do |analysis|
      sample_analysis = SampleAnalysis.new(sample: @sample, lab_analysis: analysis)
      sample_analysis.save
    end
    if @lab_analyses.blank?
      flash[:notice] = "Escolher pelo menos uma análise"
      redirect_to new_sample_sample_analysis_path
    else
      redirect_to request_path(@sample.request_id), notice: "Análises selecionadas com sucesso!"
    end
  end

  private

  def set_sample
    @sample = Sample.find(params[:sample_id])
  end
end
