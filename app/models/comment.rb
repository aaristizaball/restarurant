class Comment < ActiveRecord::Base
  attr_accessible :dish_id, :title
  
  validates :dish_id, :presence => true
  validates :title, :presence => true
  
  belongs_to :dish
end
