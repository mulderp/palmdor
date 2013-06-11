class Category < ActiveRecord::Base

  has_many :categorizations
  has_many :movies, :through => :categorizations

end
