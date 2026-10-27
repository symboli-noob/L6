class CartItemsController < ApplicationController

  # カートに商品を追加
  def create
    product = Product.find(params[:product_id])

    cart_item = @cart.cart_items.find_or_initialize_by(
      product: product
    )

    if cart_item.persisted?
      cart_item.quantity += 1
    else
      cart_item.quantity = 1
    end

    cart_item.save!

    redirect_to cart_path, notice: "カートに追加しました"
  end

  # カートの商品を削除
  def destroy
    cart_item = @cart.cart_items.find(params[:id])

    cart_item.destroy!

    redirect_to cart_path, notice: "商品をカートから削除しました"
  end

end