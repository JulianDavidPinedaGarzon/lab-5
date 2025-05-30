class MessagesController < ApplicationController
  before_action :authenticate_user!
  authorize_resource
  
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to @message, notice: 'Mensaje actualizado correctamente.'
    else
      render :edit
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_path, notice: "Mensaje eliminado correctamente." }
      format.turbo_stream
    end
  end




  private
  def message_params
    params.require(:message).permit(:chat_id, :user_id, :body)
  end
  
end
