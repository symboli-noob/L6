class ApplicationController < ActionController::Base

  allow_browser versions: :modern

  before_action :set_cart

  private

  def set_cart
    @cart = Cart.find_by(id: session[:cart_id])

    if @cart.nil?
      @cart = Cart.create!
      session[:cart_id] = @cart.id
    end
  end

end