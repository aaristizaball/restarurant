class Dish < ActiveRecord::Base
  attr_accessible :category_id, :image, :title
  
  validates :category, :presence => true
  validates :title, :presence => true
  
  belongs_to :category
  has_many :comments
  has_and_belongs_to_many :ingredients
  
  acts_as_votable
  
end
