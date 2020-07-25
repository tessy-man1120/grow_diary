require 'rails_helper'

describe Post do
  describe '#create' do

    it "titleがない場合は登録できないこと" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("が入力されていません。")
    end

    it "textがない場合は登録できないこと" do
      post = build(:post, text: nil)
      post.valid?
      expect(post.errors[:text]).to include("が入力されていません。")
    end

  end
end