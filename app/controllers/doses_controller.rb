class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id].to_i)
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(params_dose)
    @dose.cocktail_id = params['cocktail_id']
    if @dose.save
      redirect_to cocktail_path(params['cocktail_id'].to_i)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path
  end

  private

  def params_dose
    params.require('dose').permit(:description, :ingredient_id)
  end
end
