class Category < ActiveRecord::Base
  attr_accessible :position, :title

  validates :title, :presence => true
  has_many :dishes
  
end
