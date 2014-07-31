Spree::BaseHelper.class_eval do


    def create_product_image_tag(image, product, options, style)
      options.reverse_merge! alt: image.alt.blank? ? (product.name if product.is_a?(Spree::Product))||("") : image.alt
      image_tag image.attachment.url(style), options
    end

    def define_image_method(style)

      self.class.send :define_method, "#{style}_image" do |product, *options|
        options = options.first || {}
        if product.images.empty?
          if !product.is_a?(Spree::User)
            if !product.is_a?(Spree::Variant) && !product.variant_images.empty?
              create_product_image_tag(product.variant_images.first, product, options, style)
            else
              if product.is_a?(Variant) && !product.product.variant_images.empty?
                create_product_image_tag(product.product.variant_images.first, product, options, style)
              else
                image_tag "noimage/#{style}.png", options
              end
            end
          elsif product.is_a?(Spree::User)
            if !product.images.empty?
              create_product_image_tag(product.images.first, product, options, style)
            else
              image_tag "noimage/#{style}.png", options
            end
          end

        else
          create_product_image_tag(product.images.first, product, options, style)
        end
      end
    end

end
