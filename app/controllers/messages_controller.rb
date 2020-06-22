class MessagesController < ApplicationController
  before_action :group_create

  def index
    @message = Message.new
    @messages = @group.messages.order('created_at DESC')
  end


  def create
    @message = @group.messages.new(message_params)
    if @message.save
        respond_to do |format|
          format.html {redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'}
          format.json
        end
    else 
      @messages = @group.messages
      flash.now[:alert] = '【エラー】メッセージを入力してください。'
      render :index
    end
  end

private

  def message_params
    params.require(:message).permit(:content, :image)
  end


  def group_create
    @groups = Group.all
    @group = Group.find(params[:group_id])
  end
end
