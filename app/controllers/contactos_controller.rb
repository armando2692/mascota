class ContactosController <ApplicationController 
	def new
		@contacto = Contacto.new
	end
	
	def create
		@contacto = Contacto.new (secure_params)
		if @contacto.valid?
			flash[:notice] = "Su mensaje ha sido enviado satisfactoriamente"
			redirect_to root_path
		else
			render :new
		end
	end

	private 
	def secure_params
		params.require(:contacto).permit(:nombre,:email,:mensaje)
	end
end
