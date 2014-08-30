class User < ActiveRecord::Base
  has_many :ratings
  has_many :books
  has_many :book_reviews
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # stats for users
  def total_logins
    # logins
    sign_in_counter
  end

  def book_reviews_count
    PublicActivity::Activity.where(owner_id: id, key: 'book_review.create').count
  end

  def books_count
    PublicActivity::Activity.where(owner_id: id, key: 'book.create').count
  end

  def ratings_ave
    # this will not work at present, because rating with 0 starts are not counted
    # as ratings, but will show up here.
    PublicActivity::Activity.where(owner_id: id, key: 'rating.create').count
    # if ratings.count > 0
    #   ratings.average(:score)
    # else
    #   'No ratings'
    # end
  end

end
