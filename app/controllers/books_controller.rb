class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  include SortHelper

  # GET /books
  # GET /books.json
  def index
    if params[:q]
      results = Book.search do
        fulltext params[:q] do
          boost_fields :isbn => 5.0
          boost_fields :author => 3.0
          boost_fields :title => 3.0
          boost_fields :rating => 3.0
        end
        if params[:column]
          sort_params = search_sort_by
          order_by(sort_params[:column], sort_params[:order])
        end
      end
      @books = results.results
    else
      if params[:column]
        sort_params = search_sort_by

        if params[:column] == "rating"
          if params[:order] == "asc"
            @books = Book.sorted_by_rating
          else
            @books = Book.sorted_by_rating.reverse
          end
        else
          @books = Book.order("#{sort_params[:column]} #{sort_params[:order]}")
        end
      else
        @books = Book.sorted_by_rating.reverse
      end
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
    @book_review = BookReview.new book: @book
    @book_reviews = @book.book_reviews
    @user = current_user
    if @user
      @rating =
        if Rating.where("book_id = ? AND user_id = ?", @book.id, @user.id).empty?
          Rating.create!(user: @user, book: @book)
        else
          Rating.where("book_id = ? AND user_id = ?", @book.id, @user.id).first
        end
    end
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:photos, :author, :title, :status, :isbn, :rating, :active, :approved_at)
    end

end
