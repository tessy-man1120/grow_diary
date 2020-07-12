require 'rails_helper'

describe Post do
  describe '#create' do

    it "titleがない場合は登録できないこと" do
      user = build(:post, title: nil)
      user.valid?
      expect(post.errors[:title]).to include("が入力されていません。")
    end

    it "textがない場合は登録できないこと" do
      user = build(:post, text: nil)
      user.valid?
      expect(post.errors[:text]).to include("が入力されていません。")
    end

  end
end