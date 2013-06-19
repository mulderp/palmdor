class Movie < ActiveRecord::Base

  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_many :ratings

  def slug
    title.gsub(" ","-").downcase
  end

end
