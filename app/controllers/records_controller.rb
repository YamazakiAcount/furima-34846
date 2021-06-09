class RecordsController < ApplicationController

  def index
    @record_address = RecordAddress.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user || @item.record.present?
      redirect_to root_path
    end
    redirect_to new_user_session_path unless user_signed_in?
  end
  
  def create
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  def edit
    @item = Item.find(params[:item_id])
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
end
