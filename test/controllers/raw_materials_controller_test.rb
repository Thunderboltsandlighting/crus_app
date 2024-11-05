require "test_helper"

class RawMaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @raw_material = raw_materials(:one)
  end

  test "should get index" do
    get raw_materials_url
    assert_response :success
  end

  test "should get new" do
    get new_raw_material_url
    assert_response :success
  end

  test "should create raw_material" do
    assert_difference("RawMaterial.count") do
      post raw_materials_url, params: { raw_material: { category: @raw_material.category, cost_per_mpq: @raw_material.cost_per_mpq, cost_per_uom: @raw_material.cost_per_uom, mpq: @raw_material.mpq, product_description: @raw_material.product_description, re_order_level: @raw_material.re_order_level, sku: @raw_material.sku, uom: @raw_material.uom, vendor: @raw_material.vendor, vendor_contact: @raw_material.vendor_contact } }
    end

    assert_redirected_to raw_material_url(RawMaterial.last)
  end

  test "should show raw_material" do
    get raw_material_url(@raw_material)
    assert_response :success
  end

  test "should get edit" do
    get edit_raw_material_url(@raw_material)
    assert_response :success
  end

  test "should update raw_material" do
    patch raw_material_url(@raw_material), params: { raw_material: { category: @raw_material.category, cost_per_mpq: @raw_material.cost_per_mpq, cost_per_uom: @raw_material.cost_per_uom, mpq: @raw_material.mpq, product_description: @raw_material.product_description, re_order_level: @raw_material.re_order_level, sku: @raw_material.sku, uom: @raw_material.uom, vendor: @raw_material.vendor, vendor_contact: @raw_material.vendor_contact } }
    assert_redirected_to raw_material_url(@raw_material)
  end

  test "should destroy raw_material" do
    assert_difference("RawMaterial.count", -1) do
      delete raw_material_url(@raw_material)
    end

    assert_redirected_to raw_materials_url
  end
end
