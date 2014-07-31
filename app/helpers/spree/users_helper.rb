module Spree
  module UsersHelper

    # converts line breaks in product description into <p> tags (for html display purposes)
    def user_description(user)
      if Spree::Config[:show_raw_product_description]
        raw(user.description)
      else
        raw(user.description.gsub(/(.*?)\r?\n\r?\n/m, '<p>\1</p>'))
      end
    end

  end
end
