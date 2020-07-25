require 'rails_helper'

describe User do
  describe '#create' do

    it "nikcnameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("が入力されていません。")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("が内容とあっていません。")
    end

    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に使用されています。")
    end

    it " passwordが6文字以上であれば登録できること " do
      user = build(:user, password: "888888", password_confirmation: "888888")
      expect(user).to be_valid
    end

    it " passwordが5文字以下であれば登録できないこと " do
      user = build(:user, password: "88888", password_confirmation: "88888")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
    end

    it " nicknameが10文字以下であれば登録できること " do
      user = build(:user, nickname: "testman")
      expect(user).to be_valid
    end

    it " nicknameが15文字以上であれば登録できないこと " do
      user = build(:user, nickname: "testman8901")
      user.valid?
      expect(user.errors[:nickname]).to include("は10文字以下に設定して下さい。")
    end


  end
end




