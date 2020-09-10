require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "name,image,descryption,category_id,condition_id,postage_payer_id,prefecture_id,sendeing_time,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "priceが¥300~¥9,999,999の間であれば出品できる" do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank") 
      end
      it "descriptionが空では出品できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank") 
      end
      it "category_idが空では出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1") 
      end
      it "condition_idが空では出品できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1") 
      end
      it "postage_payer_idが空では出品できない" do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer must be other than 1") 
      end
      it "sending_time_idが空では出品できない" do
        @item.sending_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending time must be other than 1") 
      end
      it "priceが空では出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number") 
      end
      it "priceが半角英文字では登録できない" do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number") 
      end
      it "priceが全角数字では登録できない" do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number") 
      end
      it "priceが全角ひらがなでは登録できない" do
        @item.price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number") 
      end
      it "priceが300未満では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが10,000,000以上では登録できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999") 
      end

    end
  end
end
