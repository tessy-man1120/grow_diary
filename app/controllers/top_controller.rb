class TopController < ApplicationController

  def index
  end
  def new_guest
    user = User.find_or_create_by!(nickname:"GuestUser", email: "guest@example.com", profile:"MyGrowDiaryへようこそ。\nゲストユーザーとしてアプリの動作をご確認いただけます。\n尚、ゲストユーザーの編集・削除はできません。") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
  end
end
