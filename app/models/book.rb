class Book < ActiveRecord::Base
  searchable do
    text :author, :title, :isbn, :tags, :rating, :review
  end
  validates :author, :title, presence: true
  has_many :reservations
  has_many :ratings
  has_many :book_reviews
  has_many :followers
  attr_accessor :rating

  def approved
    !approved_at.blank?
  end

  has_attachments :photos, maximum: 1

  # validates :photos, presence: true

  def self.sorted_by_rating
    Book.all.sort_by(&:rating)
  end

  def rating
    count = ratings.count  # count ratings for this book
    if count > 0
      sum_of_ratings = ratings.where("score != 0").sum("score")
      return sum_of_ratings/count
    else
      return 0
    end
  end

  def deleteable
    true
    if (self.book_reviews.length + self.ratings.length) > 0
      false
    end
  end

  def followed? user
    Follower.where("user_id = ? and book_id = ?", user.id, self.id).length  > 0 ? true : false
  end

end
