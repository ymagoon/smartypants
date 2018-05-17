class ItemsController < ApplicationController
  before_action: :set_bundle

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.bundle = @bundle
    if @item.save
      redirect_to bundle_path(@bundle)
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to bundle_path(@bundle)
  end

  private

  def set_bundle
    @bundle = Item.find(params[:bundle_id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :color, :condition)
  end
end
