class Post < ApplicationRecord
  validates :title, :url, :sub_id, :author_id, presence: true
  
  # has_many :post_subs
  
  belongs_to :sub
  
  belongs_to :author, 
    foreign_key: :author_id, 
    class_name: :User
  

end
