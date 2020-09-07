require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、password_confirmation、first_name、family_name、first_name_kana、family_name_kana、birth_date が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailに@が存在すれば登録できる" do

      end
      it "passwordが6文字以上であれば登録できる" do
      end
      it "passwordが半角英数字混合であれば登録できる"do
      
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
      
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
      
      end
      it "first_name_kanaが全角カタカナであれば登録できる" do
      
      end
      it "family_name_kanaが全角カタカナであれば登録できる" do
      
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
      it"first_name" do
      end
       
      it "family_name"
           first_name_kana      family_name_kana        birth_date
    end
  end
end
