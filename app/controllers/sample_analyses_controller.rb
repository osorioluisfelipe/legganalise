class SampleAnalysesController < ApplicationController
  before_action :set_sample
  def new
    @sample_analysis = SampleAnalysis.new
    authorize @sample_analysis
  end

  def create
    @lab_analyses = LabAnalysis.where(id: params[:sample_analysis][:lab_analysis_id])
    @lab_analyses.each do |analysis|
      sample_analysis = SampleAnalysis.new(sample: @sample, lab_analysis: analysis)

      authorize sample_analysis

      sample_analysis.save
    end
    lab_analyses_blank(@lab_analyses, @sample)
  end

  private
  
  def set_sample
    @sample = Sample.find(params[:sample_id])
  end

  def lab_analyses_blank(lab_analyses, sample)
    if lab_analyses.blank?
      flash[:notice] = "Escolher pelo menos uma análise"
      redirect_to new_sample_sample_analysis_path
    else
      redirect_to request_path(sample.request_id), notice: "Análises selecionadas com sucesso!"
    end
  end
end
