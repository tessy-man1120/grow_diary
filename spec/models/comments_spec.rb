require 'rails_helper'

describe Comment do
  describe '#create' do
    it "textがない場合は登録できないこと" do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("が入力されていません。")
    end
  end
end
