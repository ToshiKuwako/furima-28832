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
        @user.email = "aa@aa.aa"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合であれば登録できる" do
        @user.password = "a1a1a1"
        @user.password_confirmation = "a1a1a1"
        expect(@user).to be_valid
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.first_name = "亜あア"
        expect(@user).to be_valid
      end
      it "familiy_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.family_name = "亜あア"
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カタカナであれば登録できる" do
        @user.family_name = "アアア"
        expect(@user).to be_valid
      end
      it "family_name_kanaが全角カタカナであれば登録できる" do
        @user.family_name = "アアア"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください", "Eメールは不正な値です") 
      end
      it "emailに@が含まれない場合登録できない" do
        @user.email = 'aa.aa.aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です") 
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")      
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "a0000"
        @user.password_confirmation = "a0000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが英数字混合でないと登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワード（確認用）を入力してください")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（全角）を入力してください", "苗字（全角）は不正な値です")
      end
      it "first_nameが半角（英数字・半角カタカナ）では登録できない" do
        @user.first_name = "aaaｱｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（全角）は不正な値です")
      end
      it "family_nameが空では登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（全角）を入力してください", "名前（全角）は不正な値です")
      end
      it "family_nameが半角（英数字・半角カタカナ）では登録できない" do
        @user.family_name = "aaaｱｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（全角）は不正な値です")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください", "苗字（カナ）は不正な値です")
      end
      it "first_name_kanaが半角(英数字・半角カタカナ)・全角漢字ひらがなでは登録できない" do
        @user.first_name_kana = "aaaｱｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）は不正な値です")
      end
      it "first_name_kanaが全角漢字ひらがなでは登録できない" do
        @user.first_name_kana = "亜亜亜あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）は不正な値です")
      end
      it "family_name_kanaが空では登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください", "名前（カナ）は不正な値です")
      end
      it "first_name_kanaが半角(英数字・半角カタカナ)では登録できない" do
        @user.family_name_kana = "aaaｱｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は不正な値です")
      end
      it "first_name_kanaが全角漢字ひらがなでは登録できない" do
        @user.family_name_kana = "亜亜亜あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は不正な値です")
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = "-/-/-"
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it "birth_dateの西暦が空欄では登録できない" do
        @user.birth_date = "-/1/1"
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it "birth_dateの月が空欄では登録できない" do
        @user.birth_date = "2000/-/1"
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it "birth_dateの日付が空欄では登録できない" do
        @user.birth_date = "2000/1/-"
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

    end
  end
end
