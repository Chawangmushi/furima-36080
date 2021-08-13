require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '登録できる場合のテスト' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it '@を含んでいないemailでは登録できないこと' do
      @user.email = '1234.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it 'passwordが英字のみでは登録できないこと' do
      @user.password = 'aaaabbbb'
      @user.password_confirmation = 'aaaabbbb'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end

    it 'passwordが数字のみでは登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end

    it 'passwordが全角では登録できないこと' do
      @user.password = 'あいうえお'
      @user.password_confirmation = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end

    it 'passwordとpassword_confirmationgaが一致しない場合は登録できないこと' do
      @user.password = '123qwe'
      @user.password_confirmation = '1qa2ws'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end

    it 'surnameが空では登録できないこと' do
      @user.surname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字を入力してください')
    end

    it 'surnameが半角英字では登録できないこと' do
      @user.surname = 'Arai'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字は不正な値です')
    end

    it 'surnameが半角英字では登録できないこと' do
      @user.surname = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字は不正な値です')
    end

    it 'givennameが空では登録できないこと' do
      @user.givenname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名前を入力してください')
    end

    it 'givennameが半角英字では登録できないこと' do
      @user.givenname = 'Satoshi'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は不正な値です')
    end

    it 'givennameが半角英字では登録できないこと' do
      @user.givenname = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は不正な値です')
    end

    it 'surname_furiganaが空では登録できないこと' do
      @user.surname_furigana = ''
      @user.valid?

      expect(@user.errors.full_messages).to include('フリガナ（苗字）を入力してください')
    end

    it 'surname_furiganaが半角英字では登録できないこと' do
      @user.surname_furigana = 'Arai'
      @user.valid?
      expect(@user.errors.full_messages).to include('フリガナ（苗字）は不正な値です')
    end

    it 'surname_furiganaが半角数字では登録できないこと' do
      @user.surname_furigana = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('フリガナ（苗字）は不正な値です')
    end

    it 'surname_furiganaが全角漢字では登録できないこと' do
      @user.surname_furigana = '洗'
      @user.valid?
      expect(@user.errors.full_messages).to include('フリガナ（苗字）は不正な値です')
    end

    it 'surname_furiganaが全角ひらがなでは登録できないこと' do
      @user.surname_furigana = 'あらい'
      @user.valid?
      expect(@user.errors.full_messages).to include('フリガナ（苗字）は不正な値です')
    end

    it 'surname_furiganaが半角カタカナでは登録できないこと' do
      @user.surname_furigana = 'ｱﾗｲ'
      @user.valid?
      expect(@user.errors.full_messages).to include('フリガナ（苗字）は不正な値です')
    end

    it 'givenname_furiganaが空では登録できないこと' do
      @user.givenname_furigana = ''
      @user.valid?

      expect(@user.errors.full_messages).to include('フリガナ（名前）を入力してください')
    end

    it 'givenname_furiganaが半角英字では登録できないこと' do
      @user.givenname_furigana = 'Satoshi'
      @user.valid?
      expect(@user.errors.full_messages).to include('フリガナ（名前）は不正な値です')
    end

    it 'givenname_furiganaが半角数字では登録できないこと' do
      @user.givenname_furigana = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('フリガナ（名前）は不正な値です')
    end

    it 'givenname_furiganaが全角漢字では登録できないこと' do
      @user.givenname_furigana = '理史'
      @user.valid?
      expect(@user.errors.full_messages).to include('フリガナ（名前）は不正な値です')
    end

    it 'givenname_furiganaが全角ひらがなでは登録できないこと' do
      @user.givenname_furigana = 'さとし'
      @user.valid?
      expect(@user.errors.full_messages).to include('フリガナ（名前）は不正な値です')
    end

    it 'givenname_furiganaが半角カタカナでは登録できないこと' do
      @user.givenname_furigana = 'ｻﾄｼ'
      @user.valid?
      expect(@user.errors.full_messages).to include('フリガナ（名前）は不正な値です')
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('生年月日を入力してください')
    end
  end
end
