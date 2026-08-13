class Product < ApplicationRecord
  MATERIALS = %w[金 銀 銅].freeze
  SIZES = %w[大 中 小].freeze

  validates :name, :material, :size, :price, :description, presence: true
  validates :material, inclusion: { in: MATERIALS }
  validates :size, inclusion: { in: SIZES }
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
