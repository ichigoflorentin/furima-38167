require 'rails_helper'

RSpec.describe BuyerShippingAddress, type: :model do
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_shipping_address = FactoryBot.build(:buyer_shipping_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_shipping_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buyer_shipping_address.building_name = ''
        expect(@buyer_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空では保存できない' do
        @buyer_shipping_address.postal_code = ''
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが1では登録できない' do
        @buyer_shipping_address.prefecture_id = 1
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空では保存できない' do
        @buyer_shipping_address.city = ''
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できない' do
        @buyer_shipping_address.address = ''
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @buyer_shipping_address.phone_number = nil
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeは半角数字のみでは保存できない' do
        @buyer_shipping_address.postal_code = 1_234_567
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include 'Postal code is invalid.'
      end
      it 'postal_codeは「3桁ハイフン4桁」の半角文字列でなければ保存できない' do
        @buyer_shipping_address.postal_code = 12_345 - 67
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include 'Postal code is invalid.'
      end
      it 'postal_codeは全角文字列では保存できない' do
        @buyer_shipping_address.postal_code = '１２３−４５６７'
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include 'Postal code is invalid.'
      end
      it 'phone_numberは10桁より小さければ保存できない' do
        @buyer_shipping_address.phone_number = 999_999_999
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include 'Phone number is too short (minimum is 10 characters)'
      end
      it 'phone_numberは11桁より大きければ保存できない' do
        @buyer_shipping_address.phone_number = 100_000_000_000
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include 'Phone number is too long (maximum is 11 characters)'
      end
      it 'phone_numberは半角数字以外の値では保存できない' do
        @buyer_shipping_address.phone_number = '１２３４５６７８９０'
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include 'Phone number is not a number'
      end
      it 'userが紐付いていないと保存できない' do
        @buyer_shipping_address.user_id = nil
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @buyer_shipping_address.item_id = nil
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @buyer_shipping_address.token = nil
        @buyer_shipping_address.valid?
        expect(@buyer_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
