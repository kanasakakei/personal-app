class ContactMailer < ApplicationMailer
    default from: 'notifications@example.com'
    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.contact_mailer.contact_mail.subject
    #
    def contact_mail(contact)
      @contact = contact

      mail to: ENV['MAIL'], subject: "メールのタイトル"
    end
  end

