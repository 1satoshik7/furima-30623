require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id:@user.id)
    end

    context '出品がうまくいくとき' do
      it "nameとdescription、category_idとproduct_status_id、price、freight_id、shiptoaddress_id、shipdate_id、imageが存在すれば登録できること" do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいくとき' do
      it "nameが空では登録できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "descriptionが空では登録できないこと" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idが空では登録できないこと" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "product_status_idが空では登録できないこと" do
        @item.product_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end

      it "priceが空では登録できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "freight_idが空では登録できないこと" do
        @item.freight_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Freight can't be blank")
      end

      it "shiptoaddress_idが空では登録できないこと" do
        @item.shiptoaddress_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shiptoaddress can't be blank")
      end

      it "shipdate_idが空では登録できないこと" do
        @item.shipdate_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipdate can't be blank")
      end

      it "imageが空では登録できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "販売価格は半角数字でないと登録できないこと" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが299円以下では登録できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceが10,000,000以上では登録できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "category_idが1以外でないと（--だったら）登録できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "product_status_idが1以外でないと（--だったら）登録できないこと" do
        @item.product_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status must be other than 1")
      end

      it "freight_idが1以外でないと（--だったら）登録できないこと" do
        @item.freight_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Freight must be other than 1")
      end

      it "shiptoaddress_idが1以外でないと（--だったら）登録できないこと" do
        @item.shiptoaddress_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shiptoaddress must be other than 1")
      end

      it "shipdate_idが1以外でないと（--だったら）登録できないこと" do
        @item.shipdate_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipdate must be other than 1")
      end
    end
  end
end
