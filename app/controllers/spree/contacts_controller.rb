module Spree
  class ContactsController < Spree::StoreController


  def create
    @contact = Spree::Contact.new(contact_params)
    if @contact.save

        # ContactMailer.message_email(@message).deliver
        # flash[:notice] = t('contact_thank_you')

      # TODO aqui tengo que redireccionar para la pagina donde estaba y no para el homepage.
      redirect_to(spree.root_path, :notice => t('spree.contacts.notices.success'))
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit( :from , :to, :message)
  end

  end
end
