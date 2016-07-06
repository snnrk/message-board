class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path, notice: 'メッセージを保存しました'
    else
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました"
      render 'index'
    end
  end

  def destroy
    @message.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end
  
  def edit
  end
  
  def index
    @message = Message.new
    @messages = Message.all
  end

  def update
    if @message.update(message_params)
      redirect_to root_path, notice: 'メッセージを編集しました'
    else
      render 'edit'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
end
