require 'rails_helper'

describe Group do
  describe '#create' do
    it "nameがない場合は登録できないこと" do
      group = build(:group, name: nil)
      group.valid?
      expect(group.errors[:name]).to include("が入力されていません。")
    end

    it " 重複したnameが存在する場合は登録できないこと " do
      group = create(:group)
      another_group = build(:group, name: group.name)
      another_group.valid?
      expect(another_group.errors[:name]).to include("は既に使用されています。")
    end
  end
end
