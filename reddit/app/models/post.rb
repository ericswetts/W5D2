class Post < ApplicationRecord
  validates :title, :url, presence: true
  
  has_many :post_subs

  has_many :subs, 
    through: :post_subs, 
    source: :sub
    
  belongs_to :author, 
    foreign_key: :author_id, 
    class_name: :User
    
    
  

end
