class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.joins(:cocktails).group("ingredients.id").order("count(ingredients.id) desc").limit(30)
  end

  def show
    @ingredient = Ingredient.find(params[:id])

    @cocktails = @ingredient.cocktails
  end
end
