class Recipe < ApplicationRecord
  has_many :grains, inverse_of: :recipe
  accepts_nested_attributes_for :grains, reject_if: :all_blank, allow_destroy: true

  has_many :hops, inverse_of: :recipe
  accepts_nested_attributes_for :hops, reject_if: proc { |attributes| 
attributes['name'].blank? }, allow_destroy: true

  has_many :yeasts, inverse_of: :recipe
  accepts_nested_attributes_for :yeasts, reject_if: :all_blank, allow_destroy: true

  has_many :brewing_salts, inverse_of: :recipe
  accepts_nested_attributes_for :brewing_salts, reject_if: proc { |attributes| 
attributes['name'].blank? }, allow_destroy: true

  # Other model code...
end