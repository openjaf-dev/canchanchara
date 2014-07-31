Spree::Admin::UsersController.class_eval do

      protected

        def collection
          return @collection if @collection.present?
          if request.xhr? && params[:q].present?
            @collection = Spree.user_class.includes(:bill_address, :ship_address)
                              .where("spree_users.email #{LIKE} :search
                                     OR (spree_addresses.firstname #{LIKE} :search AND spree_addresses.id = spree_users.bill_address_id)
                                     OR (spree_addresses.lastname  #{LIKE} :search AND spree_addresses.id = spree_users.bill_address_id)
                                     OR (spree_addresses.firstname #{LIKE} :search AND spree_addresses.id = spree_users.ship_address_id)
                                     OR (spree_addresses.lastname  #{LIKE} :search AND spree_addresses.id = spree_users.ship_address_id)",
                                    { :search => "#{params[:q].strip}%" })
                              .limit(params[:limit] || 100)
          else
            if !spree_current_user.admin?
              params[:q] = {}
              params[:q][:id_eq] ||= spree_current_user.id
            end
            @search = Spree.user_class.ransack(params[:q])
            @collection = @search.result.page(params[:page]).per(Spree::Config[:admin_products_per_page])
          end
        end

      private
        def user_params
          #TODO aqui no se porque C.. no funciona  PermittedAttributes.user_attributes
          params.require(:user).permit([:username, :email, :password, :password_confirmation,
                                       :title, :last_name, :first_name, :phone, :description] |
                                           [:spree_role_ids,
                                            ship_address_attributes: Spree::PermittedAttributes.address_attributes,
                                            bill_address_attributes: Spree::PermittedAttributes.address_attributes])
        end


end
