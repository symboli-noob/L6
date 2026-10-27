class ProductsController < ApplicationController

  # 商品一覧
  def index
    @products = Product.all
  end

  # 商品登録画面
  def new
    @product = Product.new
  end

  # 商品登録処理
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: "商品を登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 商品削除処理
  def destroy
    @product = Product.find(params[:id])
    @product.destroy!

    redirect_to products_path, notice: "商品を削除しました"
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end

end