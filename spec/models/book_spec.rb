require 'rails_helper'
require 'spec_helper'

RSpec.describe Book, :type => :model do
  let(:user1) {FactoryGirl.create(:user)}
  let(:user2) {FactoryGirl.create(:user)}
  let(:user3) {FactoryGirl.create(:user)}


  describe "Ratings" do
    it "should calculate an average rating" do
      book = FactoryGirl.create(:book)
      Rating.create(user: user1, book: book, score: 5)
      Rating.create(user: user2, book: book, score: 4)
      Rating.create(user: user3, book: book, score: 3)

      expect(book.rating).to eq(4)
    end
  end
end
