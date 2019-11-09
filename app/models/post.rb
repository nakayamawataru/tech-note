class Post < ApplicationRecord
    validates :title,{presence:true}
    validates :content,{presence:true}


    def user
        return User.find_by(id: self.user_id)
    end
    
    def self.search(search)
      if search
        Post.where(['content LIKE ?', "%#{search}%"])
      else
        Post.all
      end
    end

    
end
