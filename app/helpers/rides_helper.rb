module RidesHelper
	def current_user_id
		current_user.id
	end

	def errors_for(form,field)
		content_tag(:span, "#{Ride.human_attribute_name(field)} #{form.object.errors[field].try(:first)}" , class: 'help-block') if form.object.errors[field].present?
	end	

	def field_with_icon(icon, &block)
		capture(&block) + content_tag(:span, content_tag(:i, nil, class: "glyphicon glyphicon-#{icon}"), class: 'input-group-addon') 	
	end			

	def bootstrap_group_for(form, field, field_class, icon, &block)
		has_error = form.object.errors[field].present?
	
		content_tag :div, class: "form-group #{'has-error' if has_error}"  do
			concat label_tag(field, Ride.human_attribute_name(field).titleize, class: 'control-label')
			concat content_tag :div, field_with_icon(icon, &block), class: "input-group datetime #{field_class}"
			concat errors_for(form,field)
		end
	end
end


