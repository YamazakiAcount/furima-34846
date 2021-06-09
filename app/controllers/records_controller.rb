class RecordsController < ApplicationController

  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :user_item, only: [:index, :create]

  def index
    @record_address = RecordAddress.new
  end
  
  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_params
    params.require(:record_address).permit(:price, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: record_params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def user_item
    if current_user == @item.user || @item.record.present?
      redirect_to root_path
    end
  end
end
