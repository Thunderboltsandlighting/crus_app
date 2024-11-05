class RawMaterialsController < ApplicationController
  before_action :set_raw_material, only: %i[ show edit update destroy increase_stock decrease_stock ]

  # GET /raw_materials or /raw_materials.json
  def index
    @raw_materials = RawMaterial.all
  end

  # GET /raw_materials/1 or /raw_materials/1.json
  def show
  end

  # GET /raw_materials/new
  def new
    @raw_material = RawMaterial.new
  end

  # GET /raw_materials/1/edit
  def edit
  end

  # POST /raw_materials or /raw_materials.json
  def create
    @raw_material = RawMaterial.new(raw_material_params)
    @raw_material.cost_per_uom = calculate_cost_per_uom

    respond_to do |format|
      if @raw_material.save
        format.html { redirect_to @raw_material, notice: "Raw material was successfully created." }
        format.json { render :show, status: :created, location: @raw_material }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @raw_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raw_materials/1 or /raw_materials/1.json
  def update
    @raw_material.cost_per_uom = calculate_cost_per_uom

    respond_to do |format|
      if @raw_material.update(raw_material_params)
        format.html { redirect_to @raw_material, notice: "Raw material was successfully updated." }
        format.json { render :show, status: :ok, location: @raw_material }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @raw_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_materials/1 or /raw_materials/1.json
  def destroy
    @raw_material.destroy
    respond_to do |format|
      format.html { redirect_to raw_materials_url, notice: "Raw material was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # PATCH /raw_materials/1/increase_stock
  def increase_stock
    @raw_material.quantity ||= 0
    @raw_material.quantity += params[:quantity].to_f
    @raw_material.received_date = params[:received_date]
    @raw_material.purchase_order = params[:purchase_order]

    if @raw_material.save
      redirect_to @raw_material, notice: "Stock was successfully increased."
    else
      redirect_to @raw_material, alert: "Failed to increase stock."
    end
  end

  # PATCH /raw_materials/1/decrease_stock
  def decrease_stock
    @raw_material.quantity ||= 0
    @raw_material.quantity -= params[:quantity].to_f
    @raw_material.deduction_date = params[:deduction_date]
    @raw_material.reason = params[:reason]

    if @raw_material.quantity < 0
      @raw_material.quantity = 0
    end

    if @raw_material.save
      redirect_to @raw_material, notice: "Stock was successfully decreased."
    else
      redirect_to @raw_material, alert: "Failed to decrease stock."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_material
      @raw_material = RawMaterial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def raw_material_params
      params.require(:raw_material).permit(:sku, :product_description, :category, :uom, :re_order_level, :mpq, :cost_per_mpq, :cost_per_uom, :quantity, :vendor, :vendor_contact, :received_date, :purchase_order, :deduction_date, :reason)
    end

    def calculate_cost_per_uom
      mpq = raw_material_params[:mpq].to_f
      cost_per_mpq = raw_material_params[:cost_per_mpq].to_f
      return 0 if mpq == 0
      (cost_per_mpq / mpq).round(2)
    end
end