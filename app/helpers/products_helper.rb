module ProductsHelper
  def product_image_filename(product)
    {
      "金" => "pot_gold.png",
      "銀" => "pot_silver.png",
      "銅" => "pot_copper.png"
    }.fetch(product.material, "pot_gold.png")
  end

  def product_size_class(product, prefix: "pot")
    size = { "大" => "large", "中" => "medium", "小" => "small" }.fetch(product.size, "medium")
    "#{prefix}-#{size}"
  end

  def display_price(product)
    number_to_currency(product.price, unit: "¥", precision: 0, delimiter: ",")
  end
end
