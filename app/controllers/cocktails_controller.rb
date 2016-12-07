class CocktailsController < ApplicationController
  before_action :set_cocktail, only:[:show, :edit, :update, :destroy]
  before_action :set_ingredients, only:[:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      respond_to do |format|
        format.html { redirect_to cocktails_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.js
      end
    end
  end

  def edit
    @doses = @cocktail.doses
    @ingredients = Ingredient.all
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktails_path
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def set_ingredients
    @ingredients = Ingredient.all
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :stars)
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
