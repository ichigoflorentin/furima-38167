require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規投稿' do
    context '新規投稿できるとき' do
      it '全ての項目に初期値以外の値が存在すれば投稿できる' do
        expect(@item).to be_valid
      end
    end
    context '新規投稿できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'itemが空では登録できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item can't be blank"
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'shipping_charge_idが1では登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charge can't be blank"
      end
      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'shipping_date_idが1では登録できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end
      it 'priceが299円以下の値では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end
      it 'priceが10,000,000円以上の値では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end
      it 'priceが半角数字位以外の値では登録できない' do
        @item.price = "５５５"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end