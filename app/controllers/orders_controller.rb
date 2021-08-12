class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:indx,:create]
  before_action :find_item, only: [:indx,:create]


  before_action :move_to_root_path, only: [:indx,:create]

  deh index

   @order = Order.new
end

def create
  @order = Order.new(order_params)
  if @order.valid?
    pay_item
    @order.save
    rendirect_to root_path
  else
    render action: :index
  end
end

private

def find_item
  @item = Item.find(params[:item_id])
end

def order_params
  params.require(:order).permit(:postcode, :prefecture_id, :city, :bloc, :building, :phone).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])

end

def move_to_root_path
  redirect_to root_path if current_user/id == @item.user.id || @item.record ! = nil
end

def pay_item
  Payjp.api_key = "sk_test_a2bee24ad01fa80fe01c0111"
  Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency: 'jpy'
  )
end
end