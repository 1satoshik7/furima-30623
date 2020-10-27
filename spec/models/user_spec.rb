require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameとemail、passwordとpassword_confirmation、sur_name、name、sur_name_ruby、name_ruby、dateが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "sur_nameが空では登録できないこと" do
      @user.sur_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Sur name can't be blank")
    end

    it "nameが空では登録できないこと" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "sur_name_rubyが空では登録できないこと" do
      @user.sur_name_ruby = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Sur name ruby can't be blank")
    end

    it "name_rubyが空では登録できないこと" do
      @user.name_ruby = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name ruby can't be blank")
    end

    it "dateが空では登録できないこと" do
      @user.date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Date can't be blank")
    end
  end
end
