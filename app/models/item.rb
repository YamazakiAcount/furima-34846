class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :prefecture

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end

  validates :category_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :condition_id, numericality: { other_than: 1 }


  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
end
