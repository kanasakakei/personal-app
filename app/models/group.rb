class Group < ApplicationRecord
has_many :messages


  def show_last_message
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content
      else
        '画像が投稿されています'
      end
    else 
      'まだメッセージはありません'
    end
  end

end
