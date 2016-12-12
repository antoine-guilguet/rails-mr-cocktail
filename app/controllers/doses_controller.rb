class DosesController < ApplicationController
  before_action :set_cocktail
  before_action :set_dose, only: [:destroy, :edit, :update]
  before_action :set_ingredients, only: [:edit, :new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail_id = @cocktail.id
    if @dose.save!
      respond_to do |format|
        format.html { redirect_to cocktail_path(@cocktail) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.js
      end
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  def edit
  end

  def update
    @dose.update(dose_params)
    redirect_to edit_cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def set_ingredients
    @ingredients = Ingredient.all
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
