require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id:@user.id)
    end

    it "nameとdescription、category_idとproduct_status_id、price、freight_id、shiptoaddress_id、shipdate_id、imageが存在すれば登録できること" do
      expect(@item).to be_valid
    end

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
  end
end
