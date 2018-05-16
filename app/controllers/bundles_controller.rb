class BundlesController < ApplicationController
  before_action :set_bundle, only: [:show, :edit, :update, :destroy]
  def index
    @bundles = Bundle.all
  end

  def show
  end

  def new
    @bundle = Bundle.new
  end

  def create
    @bundle = Bundle.new(bundle_params)
    if @bundle.save
      redirect_to item_path(@bundle)
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