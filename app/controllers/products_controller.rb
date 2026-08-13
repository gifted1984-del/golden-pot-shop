class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: %i[ index show ]

  # GET /products or /products.json
  def index
    @query = params[:query].to_s.strip
    @material = filter_value(:material, Product::MATERIALS)
    @size = filter_value(:size, Product::SIZES)

    @products = Product.order(:material, :price)
    @products = @products.where(material: @material) if @material
    @products = @products.where(size: @size) if @size

    if @query.present?
      escaped_query = ActiveRecord::Base.sanitize_sql_like(@query)
      @products = @products.where("name LIKE :query OR description LIKE :query", query: "%#{escaped_query}%")
    end

    @visit = Visit.first_or_create!(count: 0)
    @visit.increment!(:count)
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @product.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @product.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_path, notice: "Product was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.expect(product: [ :name, :material, :size, :price, :description ])
    end

    def filter_value(key, allowed_values)
      value = params[key].presence
      value if allowed_values.include?(value)
    end
end
