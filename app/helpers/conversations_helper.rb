module ConversationsHelper
	# def trash_is_empty?	
	# 	return true if conversation.is_completely_trashed?(current_user)
	# end
	def cp(path)
  		"<div class='current'></div>" if request.url.include?(path)
	end
end
