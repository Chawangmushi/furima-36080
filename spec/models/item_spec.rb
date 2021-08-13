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
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end

      it '商品の説明(description)が空だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end

      it 'カテゴリー(category_id)が未選択（初期値のまま）だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end

      it '商品の状態(condition_id)が未選択（初期値のまま）だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end

      it '配送料の負担(shipping_payment_id)が未選択（初期値のまま）だと出品できない' do
        @item.shipping_payment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('販配送料の負担を選択してください')
      end

      it '発送元の地域(shipping_from_id)が未選択（初期値のまま）だと出品できない' do
        @item.shipping_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end

      it '発送までの日数(shipping_day_id)が未選択（初期値のまま）だと出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end

      it '価格(price)が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を入力してください')
      end

      it '価格(price)が299以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300〜9,999,999の間で入力してください')
      end

      it '価格(price)が10,000,000以上と出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300〜9,999,999の間で入力してください')
      end

      it '価格(price)が全角だと出品できない' do
        @item.price = '５００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格半角数字のみ入力可能です')
      end

      it '価格(price)が英字だと出品できない' do
        @item.price = 'abcdz'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格半角数字のみ入力可能です')
      end

      it '価格(price)が英数字混合だと出品できない' do
        @item.price = '300dollar'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格半角数字のみ入力可能です')
      end

      it '価格(price)が英数字混合だと出品できない' do
        @item.price = 'dollar300'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格半角数字のみ入力可能です')
      end

      it '価格(price)が数字と半角記号だと出品できない' do
        @item.price = '300-00'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格半角数字のみ入力可能です')
      end

      it '価格(price)が小数点があると出品できない' do
        @item.price = '300.12'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格半角数字のみ入力可能です')
      end

      it '画像(image)が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end

      it 'ユーザー情報がないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
