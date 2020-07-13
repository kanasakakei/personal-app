class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:success] = 'お問い合わせを受け付けました'
      redirect_to root_path
    else
      render :new
      flash[:false] = 'エラーが起きました'
    end
  end

  def update
    contact = Contact.find(params[:id]) #contact_mailer.rbの引数を指定
    contact.update(contact_params)
    user = contact.user
    ContactMailer.send_when_admin_reply(user, contact).deliver
  end

  private

  def contact_params
      params.require(:contact).permit(:email, :message)
  end

end
