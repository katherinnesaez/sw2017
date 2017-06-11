class AdministradorsController < ApplicationController
  before_action :set_administador, only: [:mostrar, :editar, :update, :eliminar]

  def index
    @administradors = Administrador.all
  end

  def mostrar
  end

  def nuevo
    @administradors = Administrador.new
  end

  def editar
  end

  def crear
    @administradors = Administrador.create(administrador_params)
    respond_to do |format|
      if @administradors.save
        format.html{redirect_to @administradors, notice:'ADMINITRADOR CREADO'}
      else
        format.html{render :nuevo}
      end
    end
  end

  def update
    respond_to do |format|
      if @administradors.update(administrador_params)
        format.html{redirect_to @administradors}
      else
        format.html{render :nuevo}
      end
    end
  end

  def eliminar
    @administradors.destroy
    respond_to do |format|
      format.html{redirect_to administradors_url, notice:'ADMINISTRADOR ELIMINADO'}
    end
  end

  private

  def set_administador
    @administradors = Administrador.find(params[:id])
  end

  def administrador_params
    params.require(:administradors).permit(:nombre,:edad,:desc)
  end
end
