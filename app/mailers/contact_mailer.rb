class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_mail.subject
  #
  def contact_mail(contact)
    @contact = contact

    mail to: ENV['MAIL'], subject: "メールのタイトル"
  end
  
  def send_when_admin_reply(user, contact) #メソッドに対して引数を設定
    @user = user #ユーザー情報
    @answer = contact.reply_text #返信内容
    mail to: user.email, subject: '【サイト名】 お問い合わせありがとうございます'
  end
end
