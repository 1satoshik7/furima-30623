class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :freight
  belongs_to_active_hash :shiptoaddress
  belongs_to_active_hash :shipdate

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :product_status_id
    validates :price
    validates :freight_id
    validates :shiptoaddress_id
    validates :shipdate_id
    validates :image
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_status_id
    validates :freight_id
    validates :shiptoaddress_id
    validates :shipdate_id
  end
  with_options format:{with:/\A[0-9]+\z/} do
    validates :price
  end
end
