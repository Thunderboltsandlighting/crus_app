json.extract! raw_material, :id, :sku, :product_description, :category, :uom, :re_order_level, :mpq, :cost_per_mpq, :cost_per_uom, :vendor, :vendor_contact, :created_at, :updated_at
json.url raw_material_url(raw_material, format: :json)
