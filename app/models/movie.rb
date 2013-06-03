class Movie < ActiveRecord::Base
  def slug
    title.gsub(" ","-").downcase
  end
end
