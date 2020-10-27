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

    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに＠が含まれないと登録できないこと" do
      @user.email = "test123gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが半角英字のみだと登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end

    it "passwordが半角数字のみだと登録できない" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end

    it "password_confirmationが一致しないと登録できないこと" do
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "sur_nameが空では登録できないこと" do
      @user.sur_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Sur name can't be blank")
    end

    it "sur_nameが全角（漢字・ひらがな・カタカナ）以外だと登録できない" do
      @user.sur_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Sur name is invalid")
    end

    it "nameが空では登録できないこと" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "nameが全角（漢字・ひらがな・カタカナ）以外だと登録できない" do
      @user.name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name is invalid")
    end

    it "sur_name_rubyが空では登録できないこと" do
      @user.sur_name_ruby = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Sur name ruby can't be blank")
    end

    it "sur_name_rubyが全角（カタカナ）以外だと登録できない" do
      @user.sur_name_ruby = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Sur name ruby is invalid")
    end

    it "name_rubyが空では登録できないこと" do
      @user.name_ruby = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name ruby can't be blank")
    end

    it "name_rubyが全角（カタカナ）以外だと登録できない" do
      @user.name_ruby = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name ruby is invalid")
    end

    it "dateが空では登録できないこと" do
      @user.date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Date can't be blank")
    end
  end
end
