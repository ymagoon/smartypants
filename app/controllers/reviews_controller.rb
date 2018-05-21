class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :destroy]
  before_action :set_bundle, only: [:new, :create]

  def create
    @review = Review.new(review_params)
    @review.bundle = @bundle
    @review.user = current_user
    if @review.save
      redirect_to bundle_path(@bundle)
    else
      render 'bundle_path(@bundle'
    end
  end

  def update
  end

  def destroy
    if @review.delete
      redirect_to bundle_path(@bundle)
    else
      render 'bundle_path(@bundle'
    end
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
end
