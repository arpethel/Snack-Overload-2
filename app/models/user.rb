class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable, :omniauthable
    # has_secure_password
    has_many :recipes
    has_many :posts, through: :recipes

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.provider = auth.provider
            user.name = auth.info.name
            user.uid = auth.uid
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
        end
    end

    def admin_update
        if self.admin == 0
            self.admin = false 
        elsif self.admin == 1
            self.admin = true
        end
    end
end