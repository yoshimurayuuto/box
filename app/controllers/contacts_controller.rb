class ContactsController < ApplicationController



  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

      if @contact.save
        redirect_to new_contacts_path, notice: "問い合わせ完了！"
      else
        render 'new'
      end
  end


  private
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
  def set_contact
    @contact = Contact.find(params[:id])
  end
end
