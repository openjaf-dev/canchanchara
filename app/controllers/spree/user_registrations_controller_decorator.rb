Spree::UserRegistrationsController.class_eval do

  private
    def spree_user_params
      params.require(:spree_user).permit(:username, :email, :password, :password_confirmation)
    end

end
