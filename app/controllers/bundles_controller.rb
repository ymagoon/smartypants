class BundlesController < ApplicationController
  before_action :set_bundle, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bundles = policy_scope(Bundle)
  end

  def show
    @booking = Booking.new
  end

  def new
    @bundle = current_user.bundles.new
    authorize @bundle
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
