class MessagesController < ApplicationController
  before_filter :authenticate_user!
  helper_method :mailbox, :conversation, :message

  def trash
    @msg = Mailboxer::Receipt.where(notification_id: params[:message], receiver_id: current_user.id).first
    @msg.update_attributes(trashed: true)
    redirect_to :conversations
  end

  def untrash
    msg = Mailboxer::Receipt.where(notification_id: params[:message], receiver_id: current_user.id).first
    msg.update_attributes(trashed: false)
    redirect_to '/conversations/trash'
  end

  def erase
    current_user.mark_as_deleted message
    redirect_to(:back)
  end

  def mark_as_read
    current_user.mark_as_read(message)
    redirect_to(:back)
  end

  def mark_as_unread
    current_user.mark_as_unread(message)
    redirect_to(:back)
  end

  private

  def mailbox
    @mailbox = Mailboxer::Receipt.where(receiver_id: current_user.id, mailbox_type: 'inbox').order('created_at ASC')
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def conversation_params(*keys)
    fetch_params(:conversation, *keys)
  end

  def message_params(*keys)
    fetch_params(:message, *keys)
  end

  def message
    Mailboxer::Message.find_by_id(message_params)
  end

  def fetch_params(key, *subkeys)
    params[key].instance_eval do
      case subkeys.size
      when 0 then self
      when 1 then self[subkeys.first]
      else subkeys.map{|k| self[k] }
      end
    end
  end
end