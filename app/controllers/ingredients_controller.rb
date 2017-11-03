class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.includes(:cocktails).where.not(cocktails: {id: nil})
  end

  def show
    @ingredient = Ingredient.find(params[:id])

    @cocktails = @ingredient.cocktails
  end
end
