class EstudiantesController < ApplicationController
  http_basic_authenticate_with name: "jcabrera", password: "jcabrera", only: [:list_all, :edit]

  def index
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
    @mostrar_tabla = false
    @estudiante = Estudiante.find(params[:id])
    respond_to do |format|
      format.html
      format.csv { send_data @estudiante.to_csv }
    end
  end

  def list_all
    @estudiantes = Estudiante.all.order(sigma_progress: :desc)
  end

  def edit
    @estudiante = Estudiante.find(params[:id])
  end

  def update
    puts estudiante_params
    @estudiante = Estudiante.find(params[:id])
    respond_to do |format|
      if @estudiante.update(estudiante_params)
        if estudiante_params[:sigma_complete] == "1"
          @estudiante.sigma_progress = 100
        else
          @estudiante.sigma_progress = estudiante_params[:sigma_progress]
        end
        @estudiante.save
        format.html { redirect_to listado_url, notice: 'Test was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def estudiante_params
      params.require(:estudiante).permit(:nombre, :ncuenta, :correo_electronico, :mean_correct, :sigma_correct, :sigma_complete, :sigma_progress)
    end
end
