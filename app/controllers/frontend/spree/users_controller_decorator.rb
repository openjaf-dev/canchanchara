Spree::UsersController.class_eval do

  def show
    @orders = @user.orders.complete.order('completed_at desc')
  end

  private
    def user_params
      params.require(:users).permit(Spree::PermittedAttributes.user_attributes)
    end

    def load_object
      if params[:id]
        @user = Spree::User.find params[:id]
      else
        @user ||= spree_current_user
      end

      if @user
        #authorize! params[:action].to_sym, @user
      else
        redirect_to spree.login_path
      end
    end

end
