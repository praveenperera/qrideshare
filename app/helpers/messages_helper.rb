module MessagesHelper
	def new_message_body
		message.body.gsub(/\n/, '<br/>').html_safe
	end
end