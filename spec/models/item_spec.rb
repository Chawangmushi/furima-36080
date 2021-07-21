require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能のテスト' do
    context '出品ができる場合のテスト' do
      it '全ての項目が正しく入力されている場合' do
        expect(@item).to be_valid
      end
    end

    context '出品ができない場合のテスト' do
      it '商品名(name)が空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明(description)が空だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリー(category_id)が未選択（初期値のまま）だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態(condition_id)が未選択（初期値のまま）だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担(shipping_payment_id)が未選択（初期値のまま）だと出品できない' do
        @item.shipping_payment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping payment can't be blank")
      end

      it '発送元の地域(shipping_from_id)が未選択（初期値のまま）だと出品できない' do
        @item.shipping_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping from can't be blank")
      end

      it '発送までの日数(shipping_day_id)が未選択（初期値のまま）だと出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '価格(price)が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格(price)が299以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it '価格(price)が10,000,000以上と出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it '価格(price)が全角だと出品できない' do
        @item.price = '５００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it '画像(image)が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
