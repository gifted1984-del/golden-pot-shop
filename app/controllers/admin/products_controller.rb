class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_product, only: %i[edit update destroy]

  def index
    @products = Product.order(:material, :price)
  end

  def new
    @product = Product.new
    render "products/new"
  end

  def edit
    render "products/edit"
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: "商品を登録しました。"
    else
      render "products/new", status: :unprocessable_content
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "商品を更新しました。"
    else
      render "products/edit", status: :unprocessable_content
    end
  end

  def destroy
    @product.destroy!
    redirect_to admin_products_path, notice: "商品を削除しました。", status: :see_other
  end

  private

  def set_product
    @product = Product.find(params.expect(:id))
  end

  def product_params
    params.expect(product: %i[name material size price description])
  end
end
