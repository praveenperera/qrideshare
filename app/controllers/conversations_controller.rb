class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :mailbox, :conversation

  def create
    recipient_emails = conversation_params(:recipients).split(',')
    recipients = User.where(email: recipient_emails).all

    conversation = current_user.send_message(recipients, *conversation_params(:body, :subject)).conversation
    redirect_to conversations_inbox_path

  end

  def new_message
    @msg_to = User.find_by_id(params[:id]).email
  end

  def reply
    current_user.reply_to_conversation(conversation, *conversation_params(:body, :subject))
    redirect_to(:back)
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to conversations_inbox_path
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to conversations_inbox_path
  end

  def erase
    conversation.mark_as_deleted current_user
    redirect_to conversations_inbox_path
  end

  def empty_trash
    current_user.mark_as_deleted(mailbox.trash.to_a)
    redirect_to conversations_inbox_path
  end

  def mark_as_read
    conversation.mark_as_read(current_user)
    redirect_to conversations_inbox_path
  end

  def mark_as_unread
    conversation.mark_as_unread(current_user)
    redirect_to conversations_inbox_path
  end

  def index
    redirect_to conversations_inbox_path
  end

  def inbox
    @receipts = Mailboxer::Receipt.includes(:notification => :conversation).where(receiver_id: current_user.id, mailbox_type: 'inbox', trashed: false).order('created_at DESC')
    render :inbox
  end

  def sent
    @receipts = Mailboxer::Receipt.includes(:notification => :conversation).where(receiver_id: current_user.id, mailbox_type: 'sentbox', trashed: false).order('created_at DESC')
    render :sent
  end

  def trash
    @receipts = Mailboxer::Receipt.includes(:notification => :conversation).where(receiver_id: current_user.id, trashed: true, deleted: false).order('created_at DESC')
    render :trash
  end


  private

  def mailbox
    @mailbox ||= current_user.mailbox
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