require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end



  describe '商品購入' do

    context '商品購入できる時' do

      it '必須項目全てが存在すれば購入できる' do
        expect(@order).to be_valid
      end

      it '建物名が空でも登録できること' do
        @order.building_name = ''
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

      
      it 'post_numberはハイフンがなければ購入できない' do
        @order.post_number = '1234567'
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


      it 'phone_numberが9桁以下では購入できない購入できない' do
        @order.phone_number = '0901234'
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number is invalid"
      end


      it 'phone_numberが12桁以上では購入できない購入できない購入できない' do
        @order.phone_number = '0901234567891'
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number is invalid"
      end




      it 'クレジット情報が正しく入力できてなければ購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Token can't be blank"
      end


      it 'userが紐付いていなければ購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "User can't be blank"
      end

      it 'itemが紐付いていなければ購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Item can't be blank"
      end




    end
end
