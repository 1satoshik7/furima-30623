require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '#create' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    context '出品がうまくいくとき' do
      it "postal_codeとprefecture_id、city、house_number、tell、tokenが存在すれば登録できること" do
        expect(@user_order).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it "postal_codeが空では登録できないこと" do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it "prefecture_idが空では登録できないこと" do
        @user_order.prefecture_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空では登録できないこと" do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it "house_numberが空では登録できないこと" do
        @user_order.house_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("House number can't be blank")
      end

      it "tellが空では登録できないこと" do
        @user_order.tell = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Tell can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it "prefecture_idが1以外でないと登録できないこと" do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "postal_codeにはハイフンが必要でないと登録できないこと" do
        @user_order.postal_code = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end

      it "tellが電話番号にはハイフンは不要で、10桁以上ででないと登録できないこと" do
        @user_order.tell = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Tell is invalid")
      end

      it "tellが電話番号にはハイフンは不要で、11桁以内ででないと登録できないこと" do
        @user_order.tell = 111111111111
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Tell is invalid")
      end
    end
  end
end
