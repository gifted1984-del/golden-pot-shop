require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "requires a valid catalogue product" do
    product = Product.new

    assert_not product.valid?
    assert product.errors.of_kind?(:material, :blank)
  end

  test "rejects an unknown material and a non-positive price" do
    product = Product.new(name: "壺", material: "木", size: "大", price: 0, description: "説明")

    assert_not product.valid?
    assert product.errors.of_kind?(:material, :inclusion)
    assert product.errors.of_kind?(:price, :greater_than)
  end
end
