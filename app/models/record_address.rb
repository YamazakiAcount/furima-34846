class RecordAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Input half-width characters.' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input half-width characters.' }
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, record_id: record.id)
  end

end
