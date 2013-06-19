class MovieSerializer < ActiveModel::Serializer
  attributes :title, :director, :year, :categories

  def categories
    object.categories.map { |c| c.name } 
  end

end
