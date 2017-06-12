Rails.application.routes.draw do

  root "administradors#index"

  get 'Adm/', to: 'administradors#index', as: 'administradors'
  get 'Adm/nuevo', to: 'administradors#nuevo', as: 'nuevo_administrador'
  get 'Adm/:id', to: 'administradors#mostrar', as: 'administrador'
  get 'Adm/:id/editar', to: 'administradors#editar', as: 'editar_administrador'

  put 'Adm/:id', to: 'administradors#update'
  patch 'Adm/:id', to: 'administradors#update'

  post 'Adm/', to: 'administradors#crear'
  delete 'Adm/:id',to: 'administradors#eliminar'

  get 'Clases/', to: 'clases#index', as: 'clases'
  get 'Clases/nuevo', to: 'clases#nuevo', as: 'nuevo_clase'
  get 'Clases/:id', to: 'clases#mostrar', as: 'clase'
  get 'Clases/:id/editar', to: 'clases#editar', as: 'editar_clase'

  put 'Clases/:id', to: 'clases#update'
  patch 'Clases/:id', to: 'clases#update'

  post 'Clases/:id', to: 'clases#crear'
  delete 'Clases/:id', to: 'clases#eliminar'

  get 'Alum/', to: 'alumnos#index', as: 'alumnos'
  get 'Alum/nuevo', to: 'alumnos#nuevo', as: 'nuevo_alumno'
  get 'Alum/:id', to: 'alumnos#mostrar', as: 'alumno'
  get 'Alum/:id/editar', to: 'alumnos#editar', as: 'editar_alumno'

  put 'Alum/:id', to: 'alumnos#update'
  patch 'Alum/:id', to: 'alumnos#update'

  post 'Alum/', to: 'alumnos#crear'
  delete 'Alum/:id',to: 'alumnos#eliminar'
end
