class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_bundle, only: [:new, :create, :destroy]
  before_action :set_booking, only: [:create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.bundle = @bundle
    @review.booking = @booking
    @review.user = current_user
    authorize @bundle

    if @review.save
      respond_to do |format|
        format.html { redirect_to bundle_path(@bundle) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'bundle_path(@bundle' }
        format.js  # <-- idem
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    authorize @review
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :stars, :bundle_id)
  end

  def set_bundle
    @bundle = Bundle.find(params[:bundle_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_booking
    @booking = current_user.bookings.where(bundle_id: params[:bundle_id]).first
  end

end
