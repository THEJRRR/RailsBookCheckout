require 'rails_helper'

RSpec.describe "BookReviews", :type => :request do
  describe "GET /book_reviews" do
    it "works! (now write some real specs)" do
      get book_reviews_path
      expect(response.status).to be(200)
    end
  end
end
