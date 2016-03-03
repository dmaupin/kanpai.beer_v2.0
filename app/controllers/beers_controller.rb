class BeersController < ApplicationController

  # before_action :authorize

    def index
      @beers = Beer.all.order(created_at: :desc)
      # if current_user
        # @beers = current_user.beers.all
        # @beers = current_user.beers.all.order(created_at: :desc)
        # @beers = current_user.beers.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)
      # end
    end

    def new
      @beer = Beer.new
    end

    def create
      @beer = current_user.beers.new(beer_params)
      if @beer.save
        redirect_to beers_path
      else
        flash[:danger] = "Entry needs a name"
        redirect_to new_beer_path
      end
    end

    def show
      @beer = current_user.beers.find(params[:id])
    end

    def edit
      @beer = current_user.beers.find(params[:id])    
    end

    def update
      @beer = current_user.beers.find(params[:id])
      if @beer.update(beer_params)
      redirect_to beers_path
      else
      render :edit
      end
    end

    def destroy
      @beer = current_user.beers.find(params[:id])
      @beer.destroy
      redirect_to beers_path
    end

    def beer_params
      params.require(:beer).permit(:name, :brewery, :style, :ABV, :price, :rating, :taste, :appearance, :photo, :color)
    end

end
