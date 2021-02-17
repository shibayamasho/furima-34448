require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,ユーザー本名、ユーザーカナ、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以上で半角英数字混合あれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '重複したemailが存在すれば登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'emailは、@を含まないと登録できないこと' do
        @user.email = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'パスワードが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'パスワードは、５文字以下では登録できないこと' do
        @user.password = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'パスワードは、半角英字のみでの入力では登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'パスワードは、半角数字のみでの入力では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'パスワードは、確認用を含めて2回入力すること(password_confirmationが空では登録できない)' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @user.password = '12345a'
        @user.password_confirmation = '12345ab'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'ユーザー本名は、名字が空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'ユーザー本名は、名前が空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）以外での入力では登録できないこと' do
        @user.last_name = '鈴木aa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）以外での入力では登録できないこと' do
        @user.first_name = '一郎aa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it 'ユーザー本名のフリガナは、名字が空では登録できないこと' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name katakana can't be blank"
      end

      it 'ユーザー本名のフリガナは、名前が空では登録できないこと' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name katakana can't be blank"
      end

      it 'ユーザー本名のフリガナは、名字が全角（カタカナ）以外での入力があれば登録できないこと' do
        @user.last_name_katakana = 'スズキ鈴木'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name katakana is invalid'
      end

      it 'ユーザー本名のフリガナは、名前が全角（カタカナ）以外での入力があれば登録できないこと' do
        @user.first_name_katakana = 'イチロー一郎'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name katakana is invalid'
      end

      it '生年月日が空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
