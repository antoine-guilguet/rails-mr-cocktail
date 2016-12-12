class ReviewsController < ApplicationController
  before_action :set_cocktail, only:[:create, :destroy]
  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @review.cocktail = @cocktail
    if @review.save
      respond_to do |format|
        format.html { redirect_to cocktail_path(@cocktail) }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to cocktail_path(@cocktail) }
        format.js
      end
    end
  end

  def destroy

  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
