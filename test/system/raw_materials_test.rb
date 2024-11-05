require "application_system_test_case"

class RawMaterialsTest < ApplicationSystemTestCase
  setup do
    @raw_material = raw_materials(:one)
  end

  test "visiting the index" do
    visit raw_materials_url
    assert_selector "h1", text: "Raw materials"
  end

  test "should create raw material" do
    visit raw_materials_url
    click_on "New raw material"

    fill_in "Category", with: @raw_material.category
    fill_in "Cost per mpq", with: @raw_material.cost_per_mpq
    fill_in "Cost per uom", with: @raw_material.cost_per_uom
    fill_in "Mpq", with: @raw_material.mpq
    fill_in "Product description", with: @raw_material.product_description
    fill_in "Re order level", with: @raw_material.re_order_level
    fill_in "Sku", with: @raw_material.sku
    fill_in "Uom", with: @raw_material.uom
    fill_in "Vendor", with: @raw_material.vendor
    fill_in "Vendor contact", with: @raw_material.vendor_contact
    click_on "Create Raw material"

    assert_text "Raw material was successfully created"
    click_on "Back"
  end

  test "should update Raw material" do
    visit raw_material_url(@raw_material)
    click_on "Edit this raw material", match: :first

    fill_in "Category", with: @raw_material.category
    fill_in "Cost per mpq", with: @raw_material.cost_per_mpq
    fill_in "Cost per uom", with: @raw_material.cost_per_uom
    fill_in "Mpq", with: @raw_material.mpq
    fill_in "Product description", with: @raw_material.product_description
    fill_in "Re order level", with: @raw_material.re_order_level
    fill_in "Sku", with: @raw_material.sku
    fill_in "Uom", with: @raw_material.uom
    fill_in "Vendor", with: @raw_material.vendor
    fill_in "Vendor contact", with: @raw_material.vendor_contact
    click_on "Update Raw material"

    assert_text "Raw material was successfully updated"
    click_on "Back"
  end

  test "should destroy Raw material" do
    visit raw_material_url(@raw_material)
    click_on "Destroy this raw material", match: :first

    assert_text "Raw material was successfully destroyed"
  end
end
