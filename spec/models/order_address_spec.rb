require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user1.id)
    @order_address = FactoryBot.build(:order_address, user_id: user2.id, item_id: item.id)
    sleep(1)
  end

  describe '商品の購入' do
    context '商品が購入できるとき' do
      it '必要な情報を適切に入力すると、商品が購入できること' do
        expect(@order_address).to be_valid
      end

      it 'building_name(建物名)が空でも購入できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'tokenが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end

      it 'postal_code(郵便番号)が空では購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_code(郵便番号)がハイフン(-)が含まれなければ購入できない' do
        @order_address.postal_code = 1234567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end

      it 'prefecture_id(都道府県)が空では購入できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'prefecture_id(都道府県)が1(--)では購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture must be other than 1"
      end

      it 'municipalities(市町村)が空では購入できない' do
        @order_address.municipalities = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Municipalities can't be blank"
      end

      it 'Address(番地)が空では購入できない' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end

      it 'phone_number(電話番号)が空では購入できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end

      it 'phone_number(電話番号)が全角では購入できない' do
        @order_address.phone_number = "０９０１１１１２２２２"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end

      it 'phone_number(電話番号)が数字のみでないと購入できない' do
        @order_address.phone_number = "0901111222a"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end

      it 'user_idが空では購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end

      it 'item_idが空では購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end

    end
  end
end
