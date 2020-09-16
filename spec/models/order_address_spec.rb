require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end
  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "zip_code,prefecture_id,city,house_number,phone_numberが存在すれば登録できる" do
        expect(@order).to be_valid
      end
      it "zip_codeが{半角数字3文字-半角数字4文字}なら登録できる" do
        @order.zip_code = "333-3333"
        expect(@order).to be_valid
      end
      it "phone_numberが半角数字11字以内なら登録できる" do
        @order.phone_number = "09012345678"
        expect(@order).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it "zip_codeが空では購入できない" do
        @order.zip_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip code can't be blank", "Zip code is invalid")
      end
      it "zip_codeが全角数字では登録できない" do
      @order.zip_code = "１１１-１１１１"
      @order.valid?
      expect(@order.errors.full_messages).to include("Zip code is invalid")
      end
      it "zip_codeに『-』がないと登録できない"  do
        @order.zip_code = "1111111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip code is invalid")
      end
      it "zip_codeの'-'の前が4字以上の数字では登録できない" do
        @order.zip_code = "1111-1111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip code is invalid")
      end
      it "zip_codeの'-'の後ろが5字以上の数字では登録できない" do
        @order.zip_code = "111-11111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip code is invalid")
      end
      it 'prefecture_idを選択していないと登録できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "cityが空では登録できない" do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空では登録できない" do
        @order.house_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空では登録できない" do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it "phone_numberが12字以上では登録できない" do
        @order.phone_number = "090123456789"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが全角数字では登録できない" do
        @order.phone_number = "０９０１２３４５６７８" 
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberに'-'が入っていると登録できない" do
        @order.phone_number = "090-1234-5678"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end 
      it "tokenが空では登録できない" do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
