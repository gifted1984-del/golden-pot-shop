module ProductsHelper
  def product_image_filename(product)
    {
      "金" => "vase-gold-studio-v2.png",
      "銀" => "vase-silver-studio-v2.png",
      "銅" => "vase-copper-studio-v2.png"
    }.fetch(product.material, "vase-gold-studio-v2.png")
  end

  def product_size_class(product, prefix: "pot")
    size = { "大" => "large", "中" => "medium", "小" => "small" }.fetch(product.size, "medium")
    "#{prefix}-#{size}"
  end

  def display_price(product)
    number_to_currency(product.price, unit: "¥", precision: 0, delimiter: ",")
  end
end
