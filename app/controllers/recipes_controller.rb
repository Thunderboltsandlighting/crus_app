class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @recipe.grains.build
    @recipe.hops.build
    @recipe.yeasts.build
    @recipe.brewing_salts.build
    @recipe.miscs.build
    @inventory_grains = RawMaterial.where(category: 'Grain')
    @inventory_hops = RawMaterial.where(category: 'Hop')
    @inventory_yeasts = RawMaterial.where(category: 'Yeast')
    @inventory_misc = RawMaterial.where(category: 'Misc')
    @styles = load_styles
  end

  # GET /recipes/1/edit
  def edit
    @styles = load_styles
    @inventory_grains = RawMaterial.where(category: 'Grain')
    @inventory_hops = RawMaterial.where(category: 'Hop')
    @inventory_yeasts = RawMaterial.where(category: 'Yeast')
    @inventory_misc = RawMaterial.where(category: 'Misc')
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :style, :abv, :ibu, :srm, :description, grains_attributes: [:id, :name, :amount, :uom, :total_cost, :_destroy], hops_attributes: [:id, :name, :amount, :uom, :time, :ibu, :hop_type, :total_cost, :_destroy], yeasts_attributes: [:id, :name, :amount, :uom, :total_cost, :_destroy], brewing_salts_attributes: [:id, :name, :amount, :uom, :total_cost, :_destroy], miscs_attributes: [:id, :name, :amount, :uom, :total_cost, :_destroy])
  end

  def load_styles
    JSON.parse(File.read(Rails.root.join('app/assets/styles.json')))
  end
end