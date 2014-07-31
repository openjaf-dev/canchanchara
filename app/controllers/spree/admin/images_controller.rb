module Spree
  module Admin
    class ImagesController < ResourceController
      before_filter :load_data

      create.before :set_viewable
      update.before :set_viewable

      private

        def location_after_destroy
          admin_product_images_url(@product)
        end

        def location_after_save
          if @product
            admin_product_images_url(@product)
          elsif @user
            admin_user_images_url(@user)
          end
        end

        def load_data
          if params[:product_id]
            @product = Product.friendly.find(params[:product_id])
            @variants = @product.variants.collect do |variant|
              [variant.sku_and_options_text, variant.id]
            end
            @variants.insert(0, [Spree.t(:all), @product.master.id])
          elsif params[:user_id]
            @user = User.find(params[:user_id])
          end
        end

        def set_viewable
          if params[:product_id]
            @image.viewable_type = 'Spree::Variant'
            @image.viewable_id = params[:image][:viewable_id]
          elsif params[:user_id]
            @image.viewable_type = 'Spree::User'
            @image.viewable_id = params[:user_id]
          end
        end

    end
  end
end
