class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :charge_bearer
  belongs_to :shipping_area
  belongs_to :delivary_day


  validates :name, :image, :text, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :charge_bearer_id, numericality: { other_than: 1 }
  validates :delivary_day_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

end
