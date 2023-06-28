class AuthorSerializer < ActiveModel::Serializer
  attributes :name
  has_one :profile
  has_many :posts

  def profile
    object.profile.slice(:username, :email, :bio, :avatar_url)
  end

  def posts
    object.posts.map do |post|
      {
        title: post.title,
        short_content: "#{post.content[0..39]}...",
        tags: post.tags.map { |tag| { name: tag.name } }
      }
    end
  end
end
