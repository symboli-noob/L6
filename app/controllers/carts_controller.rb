class CartsController < ApplicationController

  def show
    @cart_items = @cart.cart_items.includes(:product)

    @total = @cart_items.sum do |item|
      item.product.price * item.quantity
    end
  end

end