class User < ApplicationRecord
    has_secure_password
    has_many :posts

    def admin_update
        if self.admin == 0
            self.admin = false 
        elsif self.admin == 1
            self.admin = true
        end
    end
end