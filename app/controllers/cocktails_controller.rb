class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.all
  end

  def new
    @cocktail = Cocktail.new
    @cocktail.doses.build
  end

  def create

    @cocktail = Cocktail.new(cocktail_params)
    raise
    cocktail_params[:ingredient_ids].each do |ingredient_id|
      unless ingredient_id == ""
       i = Ingredient.find(ingredient_id)
       d1 = Dose.new
       d1.description = @cocktail.doses.description1
       # d1.cocktail = ...
       # d1.ingredient =

      end
    end

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredient_ids, :doses, :photo)
  end
end
