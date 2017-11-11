class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :update, :like, :unlike]

  def index
    @cocktails = Cocktail.all
  end

  def favorites
    @cocktails = current_user.find_up_voted_items
  end

  def home
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    @cocktail.update(cocktail_params)
    
    redirect_to cocktail_path(@cocktail)
  end

  def like 
    @cocktail.liked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render layout: false }
    end
  end  

  def unlike
    @cocktail.unliked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render layout: false }
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :photo)
  end
end
