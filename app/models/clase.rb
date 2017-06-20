class Clase < ActiveRecord::Base
	belongs_to :administrador
	belongs_to :profesor
	has_many :asistencia

	validates :nombre,  presence: true, length: { minimum: 2 }, uniqueness: true
	validates :desc, length: { maximum: 500 }
end
