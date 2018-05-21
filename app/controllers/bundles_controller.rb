class BundlesController < ApplicationController
  before_action :set_bundle, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @query = params[:name] || params[:age_group] ? true : false
    if @query
      @bundles = Bundle.where("name ilike ? AND age_group like ?", "%#{params[:name]}%", "%#{params[:age_group]}%")
    else
      @bundles = Bundle.all
    end
  end

  def mybundles
    @bundles = Bundle.where(user: current_user)
  end

  def show
    @booking = Booking.new
  end

  def new
    @bundle = Bundle.new
  end

  def create
    @bundle = Bundle.new(bundle_params)
    @bundle.user = current_user
    if @bundle.save
      redirect_to new_bundle_item_path(@bundle)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @bundle.update(bundle_params)
      redirect_to bundle_path(@bundle)
    else
      render 'edit'
    end
  end

  def destroy
    if @bundle.delete
      redirect_to bundles_path
    end
  end

  private

  def set_bundle
    @bundle = Bundle.find(params[:id])
  end

  def bundle_params
    params.require(:bundle).permit(:name, :gender, :age_group, :price_per_day, :photo)
  end

end
