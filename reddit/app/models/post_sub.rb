class PostSub < ApplicationRecord
  belongs_to :subs
  belongs_to :posts
end
