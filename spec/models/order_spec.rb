require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @order = FactoryBot.build(:order_address)
  end



  describe '商品購入' do

    context '商品購入できる時' do

      it '必須項目全てが存在すれば購入できる' do
        expect(@order).to be_valid
      end

    end
  end

    context '商品購入できない時' do

      it 'post_numberが空では購入できない' do
        @order.post_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Post number can't be blank"
      end


      it 'post_numberが半角数字出ないと購入できない' do
        @order.post_number = '１２３−１２３４'
        @order.valid?
        expect(@order.errors.full_messages).to include "Post number is invalid"
      end



      it 'shipping_area_idが1のときは購入できない' do
        @order.shipping_area_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include "Shipping area must be other than 1"
      end

      it 'cityが空では購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "City can't be blank"
      end

      it 'house_numberが空では購入できない' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "House number can't be blank"
      end


      it 'phone_numberが空では購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number can't be blank"
      end

      it 'phone_numberが半角数字ではないと購入できない' do
        @order.phone_number = '０９０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number is invalid"
      end


      it 'クレジット情報が正しく入力できてなければ購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Token can't be blank"
      end



    end
end
