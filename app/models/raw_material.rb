class RawMaterial < ApplicationRecord
  validates :sku, :product_description, :category, :uom, :re_order_level, :mpq, :cost_per_mpq, :cost_per_uom, :vendor, :vendor_contact, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  before_save :set_default_quantity

  private

  def set_default_quantity
    self.quantity ||= 0
  end
end