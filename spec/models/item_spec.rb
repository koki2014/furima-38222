require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @item = FactoryBot.build(:item)
  end


  describe '出品情報登録' do


    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
      
    end

    it 'textが空では登録できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Text can't be blank"
      
    end

    it 'category_idが1では登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 1"
      
    end

    it 'condition_idが1では登録できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition must be other than 1"
      
    end

    it 'charge_bearer_idが1では登録できない' do
      @item.charge_bearer_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Charge bearer must be other than 1"
      
    end

    it 'shipping_area_idが1では登録できない' do
      @item.shipping_area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping area must be other than 1"
      
    end

    it 'delivary_day_idが1では登録できない' do
      @item.delivary_day_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivary day must be other than 1"
      
    end

    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
      
    end

    it 'priceが300以下では登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      
    end

    it 'priceが10000000以上では登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      
    end

    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
      
    end

    it '価格に半角数字以外が含まれている場合は出品できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
      
    end

    it 'userが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ('User must exist')

    end

  
    it '必須項目全てが存在すれば出品できる' do
      expect(@item).to be_valid
    end

  end
end
