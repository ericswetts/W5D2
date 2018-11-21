class Post < ApplicationRecord
  validates :title, :url, :author_id, presence: true
  
  has_many :post_subs

  has_many :subs, 
    through: :post_subs, 
    source: :subs
    
  belongs_to :author, 
    foreign_key: :author_id, 
    class_name: :User
    
    
  

end
