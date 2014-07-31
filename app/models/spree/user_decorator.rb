module Spree
  User.class_eval do
    #has_many :ratings, dependent: :destroy
    has_many :products, dependent: :destroy
    #has_many :questions, dependent: :destroy

    has_many :images, -> { order(:position) }, as: :viewable, dependent: :destroy, class_name: "Spree::Image"

    before_create :set_role

    #validates_presence_of :username
    validates :username, length: { in: 4..20 }

    #include Spree::Core::S3Support
    #supports_s3 :icon

    def set_role
      role = Spree::Role.find_by name:"user"
      self.spree_roles << role
    end

    #def self.ratings
    #  count = Spree::Rating.where(user_id:self.id).count
    #  rating = 0
    #  Spree::Rating.where(user_id:self.id).each do |ret|
    #     rating += ret.rating
    #  end
    #  rating/count
    #end
    private

      def set_login
        # for now force login to be same as email, eventually we will make this configurable, etc.
        self.login ||= self.username if self.username
      end

  end
end
