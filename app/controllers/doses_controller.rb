class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktails_path
    else
      render new
    end
  end

  def edit
    @dose = Dose.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end
