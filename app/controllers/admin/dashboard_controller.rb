class Admin::DashboardController < ApplicationController
  def index
    @product_count = Product.count
    @visit_count = Visit.first&.count || 0

    @gold_count = Product.where(material: "金").count
    @silver_count = Product.where(material: "銀").count
    @copper_count = Product.where(material: "銅").count
  end
end