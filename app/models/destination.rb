class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def get_last
        self.posts.last(5)
    end

end
