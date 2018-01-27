class EstudiantesController < ApplicationController
  def index
    @estudiantes = Estudiante.all
  end
  def new
    @estudiante = Estudiante.new
  end
  def create
    require 'descriptive-statistics'
    require 'distribution'
    @estudiante = Estudiante.new(estudiante_params)
    normal = Distribution::Normal.rng(@estudiante.exact_mean, @estudiante.exact_sigma, @estudiante.seed)
    norm_distribution = 100.times.map {normal.call.round(4)}
    @estudiante.data = norm_distribution
    stats = DescriptiveStatistics::Stats.new(norm_distribution)
    @estudiante.real_mean = stats.mean
    @estudiante.real_sigma = stats.standard_deviation
    if @estudiante.save
      UserMailer.email(@estudiante).deliver
      redirect_to @estudiante
    else
      render 'new'
    end
  end
  def show
    @estudiante = Estudiante.find(params[:id])
    respond_to do |format|
      format.html
      format.csv { send_data @estudiante.to_csv }
    end
  end
  private
    def estudiante_params
      params.require(:estudiante).permit(:nombre, :ncuenta, :correo_electronico)
    end
end
