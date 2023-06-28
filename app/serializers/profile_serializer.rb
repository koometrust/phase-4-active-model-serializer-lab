class PostSerializer < ActiveModel::Serializer
  attributes :title, :content
  belongs_to :author
  has_many :tags

  def tags
    object.tags.map { |tag| { name: tag.name } }  # Include tags' names
  end
end
