module Spree
  class ContactsController < Spree::StoreController


  def create
    @contact = Spree::Contact.new(contact_params)
    if @contact.save

         ContactMailer.contact_email(@contact).deliver

      # TODO aqui tengo que redireccionar para la pagina donde estaba y no para el homepage.
      redirect_to(spree.root_path, :notice => t('spree.contacts.notices.success'))
    else
      redirect_to(spree.root_path, :notice => t('spree.contacts.notices.error'))
    end
  end

  private

  def contact_params
    params.require(:contact).permit( :from , :to, :message, :email)
  end

  end
end
