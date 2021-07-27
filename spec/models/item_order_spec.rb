require 'rails_helper'
RSpec.describe ItemOrder, type: :model do
  before do
    #@item = FactoryBot.create(:item)
    #@user = FactoryBot.create(:user)
    @item = 1
    @user = 1
    @item_order = FactoryBot.build(:item_order, item_id: @item, user_id: @user)

  end

  describe '購入のテスト' do
    context '購入できる場合のテスト' do
      it '全ての項目が正しく入力されている場合' do
        expect(@item_order).to be_valid
      end

      it '建物名は空白でも登録できる' do
        @item_order.building_name = ''
        expect(@item_order).to be_valid
      end

    end

    context '購入ができない場合のテスト' do

      it 'item_id が空だと登録できない' do
        @item_order.item_id = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号が空白だと購入できない' do
        @item_order.postalcode = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postalcode can't be blank")
      end

      it '郵便番号が半角数字とハイフン以外だと購入できない' do
        @item_order.postalcode = '１２３−４５６'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postalcode is invalid")
      end

      it '郵便番号が3桁-4桁の形以外だと購入できない' do
        @item_order.postalcode = '1234-567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postalcode is invalid")
      end

      it '都道府県が初期値（ーー）のままでは購入できない' do
        @item_order.shipping_from_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Shipping from can't be blank")
      end

      it '市区町村が空白だと購入できない' do
        @item_order.city = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空白だと購入できない' do
        @item_order.banchi = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Banchi can't be blank")
      end

      it '電話番号が空白だと購入できない' do
        @item_order.phone = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号が全角数字だと購入できない' do
        @item_order.phone = '１２３４５６７８９'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone is invalid. Please input half-width numbers")
      end

      it '電話番号が英字だと購入できない' do
        @item_order.phone = '123abcd89'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone is invalid. Please input half-width numbers")
      end

      it '電話番号がハイフン有りと購入できない' do
        @item_order.phone = '01234-5678'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone is invalid. Please input half-width numbers")
      end

      it '電話番号が9桁以下だと購入できない' do
        @item_order.phone = '123456789'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone is too short (minimum is 10 characters)")
      end

      it '電話番号が12桁以上だと購入できない' do
        @item_order.phone = '123456789123'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end

      it 'クレジットカード情報が記入されていないと購入できない' do
        @item_order.token = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'item_id が空だと登録できない' do
        @item_order.item_id = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_id が空だと登録できない' do
        @item_order.user_id = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end


    end
  end
end
