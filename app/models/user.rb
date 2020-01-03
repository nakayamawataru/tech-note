class User < ApplicationRecord
    validates :name,{uniqueness: true,presence: true}
    validates :mail,{presence: true,uniqueness: { case_sensitive: false }}#一意性の検証（大文字小文字区別しない）, 
    validates :password,{presence: true, on: :create, allow_nil: true}#作成時には空っぽだめ。編集時には空で送ってもok(→変更されない)
    has_secure_password
    
    def posts
        return Post.where(user_id: self.id)
    end
    
    def likes
        return Like.where(user_id: self.id)
    end
end
