require 'rails_helper'
RSpec.describe Shipping, type: :model do
  before do
    @shipping = FactoryBot.build(:shipping)
    # @item = FactoryBot.create(:item)
    # @user = FactoryBot.create(:user)
    # sleep(1)
  end

  describe '購入のテスト' do
    context '購入できる場合のテスト' do
      it '全ての項目が正しく入力されている場合' do
        expect(@shipping).to be_valid
      end
    end

    context '購入ができない場合のテスト' do
      it '郵便番号が空白だと購入できない' do
        @shipping.postalcode = ''
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Postalcode can't be blank")
      end

      it '郵便番号が半角数字とハイフン以外だと購入できない' do
        @shipping.postalcode = '１２３−４５６'
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include('postalcode is invalid')
      end

      it '郵便番号が3桁-4桁の形以外だと購入できない' do
        @shipping.postalcode = '1234-567'
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include('postalcode is invalid')
      end
    end
  end
end
