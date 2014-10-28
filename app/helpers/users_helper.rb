module UsersHelper
	def valid 
		if @validatable 
			"#{@minimum_password_length} characters minimum" 
		end
	end
end	