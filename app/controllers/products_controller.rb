class ProductsController < ApplicationController
  before_action :set_product, only: :show

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

  def show
  end

  private

  def set_product
    @product = Product.find(params.expect(:id))
  end

  def filter_value(key, allowed_values)
    value = params[key].presence
    value if allowed_values.include?(value)
  end
end
