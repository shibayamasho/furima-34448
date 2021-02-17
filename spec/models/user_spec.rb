require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it "nickname,email,password,password_confirmation,ユーザー本名、ユーザーカナ、生年月日が存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordとpassword_confirmationが6文字以上で半角英数字混合あれば登録できる" do
        @user.password = "12345a"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき'do
      it "nicknameが空では登録できないこと" do
        
      end
      
      it "emailが空では登録できないこと" do
        
      end

      it "重複したemailが存在すれば登録できないこと" do
        
      end

      it "emailは、@を含まないと登録できないこと" do
        
      end

      it "パスワードが空では登録できないこと" do
        
      end
      
      it "パスワードは、５文字以下では登録できないこと" do
        
      end

      it "パスワードは、半角英字のみでの入力では登録できないこと" do
        
      end

      it "パスワードは、半角数字のみでの入力では登録できないこと" do
        
      end

      it "パスワードは、確認用を含めて2回入力すること(password_confirmationが空では登録できない)" do
        
      end
      
      it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
        
      end
      
      it "ユーザー本名は、名字が空では登録できないこと" do
        
      end

      it "ユーザー本名は、名前が空では登録できないこと" do
        
      end
      
      it "ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）以外での入力では登録できないこと" do
        
      end

      it "ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）以外での入力では登録できないこと" do
        
      end

      it "ユーザー本名のフリガナは、名字が空では登録できないこと" do
        
      end
      
      it "ユーザー本名のフリガナは、名前が空では登録できないこと" do
        
      end

      it "ユーザー本名のフリガナは、名字が全角（カタカナ）以外での入力があれば登録できないこと" do
        
      end

      it "ユーザー本名のフリガナは、名前が全角（カタカナ）以外での入力があれば登録できないこと" do
        
      end

      it "生年月日が空では登録できないこと" do
        
      end
    end
  end



end
