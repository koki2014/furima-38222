class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  
  validates :shipping_area_id, numericality: { other_than: 1 }

  


  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A[0-9]{11}\z/ }
  end



  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(post_number: post_number, shipping_area_id: shipping_area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end