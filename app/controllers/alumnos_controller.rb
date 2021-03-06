class AlumnosController < ApplicationController
  load_and_authorize_resource
  before_action :set_alumno, only: [:mostrar, :editar, :update, :eliminar]

  def index
    @alumnos = Alumno.paginate(:page => params[:page], :per_page => 5)
  end

  def mostrar
    @pagos = Pago.all
  end

  def nuevo
    @alumnos = Alumno.new
  end

  def editar
  end

  def crear
    @alumnos = Alumno.create(alumno_params)
    respond_to do |format|
      if @alumnos.save
        format.html{redirect_to @alumnos, notice:'Alumno Ingresado'}
      else
        format.html{render :nuevo}
      end
    end
  end

  def update
    respond_to do |format|
      if @alumnos.update(alumno_params)
        format.html{redirect_to @alumnos}
      else
        format.html{render :nuevo}
      end
    end
  end

  def eliminar
    @alumnos.destroy
    respond_to do |format|
      format.html{redirect_to alumnos_url, notice:'Alumno Eliminado'}
    end
  end

  private

  def set_alumno
    @alumnos = Alumno.find(params[:id])
  end

  def alumno_params
    params.require(:alumno).permit(:nombre, :sexo, :edad, :plan_id, :create_at, :rut, :desc)
  end
end
