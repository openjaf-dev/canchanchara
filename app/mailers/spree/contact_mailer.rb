module Spree
  class ContactMailer < ActionMailer::Base


    def contact_email contact
      @contact = contact

      mail(
        :to => Spree::User.find(contact.to).email,
        :bcc => site_owner_email,
        :reply_to => contact.email,
        :from => contact.email,
        :subject => "#{Spree::Config[:site_name]} : #{contact.message}"
      )
    end


    private
    def mail_from
      Spree::MailMethod.current.try(:preferred_mails_from)
    end

    def site_owner_email
      'spree@example.com'
      # Spree::MailMethod.current.try(:preferred_mails_from)
    end
  end

end
