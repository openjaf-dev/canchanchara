module Spree
  class Contact < ActiveRecord::Base

    validates :message, :presence => true
    # validates :email, :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    # after_save do
    #   ContactMailer.notification(self).deliver # to submitter
    #   ContactMailer.confirmation(self).deliver # to admin
    # end

  end
end
