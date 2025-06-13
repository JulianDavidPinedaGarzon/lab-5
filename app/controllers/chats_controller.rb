class ChatsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource
  
  def index
    @chats = Chat.involving(curren_user).includes(:sender, :receiver)
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def new
    @chat = Chat.new
  end
  
  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to chats_path
    else
      render :new
    end
  end

  def edit
  @chat = Chat.find(params[:id])
  end

  def update
    @chat = Chat.find(params[:id])
    if @chat.update(chat_params)
      redirect_to @chat, notice: 'Chat actualizado correctamente.'
    else
      render :edit
    end
  end

  
  private
  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end
  
end
