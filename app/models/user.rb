class User < ApplicationRecord
    validates :name,{uniqueness: true,presence:true}
    validates :mail,{presence: true}
    validates :mail,uniqueness: { case_sensitive: false } #一意性の検証（大文字小文字区別しない）
    validates :password,{presence:true}
    has_secure_password
    
    def posts
        return Post.where(user_id: self.id)
    end
end
