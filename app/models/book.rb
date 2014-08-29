class Book < ActiveRecord::Base
  searchable do
    text :author, :title, :isbn, :tags, :rating, :review
  end
  validates :author, :title, presence: true
  has_many :reservations
  has_many :ratings
  has_many :book_reviews
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

end
