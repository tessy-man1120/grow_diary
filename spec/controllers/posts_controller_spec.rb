require 'rails_helper'

describe PostsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @post = @user.posts.create(title: "タイトルですよ",text: "テキストですよ")
  end

  describe "#index" do
    it "正常に遷移できるか" do
      get :index
      expect(response).to be_success
    end
    it "200レスポンスが返ってきているか" do
      get :index
      expect(response).to have_http_status "200"
    end
  end
  
  describe "#show" do
    it "正常に遷移できるか" do
      sign_in @user
      get :show, params: {id: @post.id}
      expect(response).to be_success
    end
    it "200レスポンスが返ってきているか" do
      sign_in @user
      get :show, params: {id: @post.id}
      expect(response).to have_http_status "200"
    end
  end

  describe "#new" do
    it "正常に遷移できるか" do
      sign_in @user
      get :new, params: {id: @post.id}
      expect(response).to be_success
    end
    it "200レスポンスが返ってきているか" do
      sign_in @user
      get :new, params: {id: @post.id}
      expect(response).to have_http_status "200"
    end
  end

  describe "#create" do
    it "正常に記事を作成できるか" do
      sign_in @user
      expect {
        post :create, params: {
          post: {
            title: "タイトル作成",
            text: "テキスト作成"
          }
        }
      }.to change(@user.posts, :count).by(1)
    end
    it "記事作成後、投稿一覧ページにリダイレクトされるか" do
      sign_in @user
        post :create, params: {
          post: {
            title: "タイトル作成",
            text: "テキスト作成"
          }
        }
        expect(response).to redirect_to posts_path
    end
    it "不正記事の場合、作成できなくなっているか" do
      sign_in @user
      expect {
        post :create, params: {
          post: {
            title: nil,
            text: "テキスト作成"
          }
        }
      }.to_not change(@user.posts, :count)
    end
    it "不正記事の場合、作成ページにリダイレクトされるか" do
      sign_in @user
        post :create, params: {
          post: {
            title: "タイトル作成",
            text: nil,
          }
        }
      expect(response).to redirect_to new_post_path
    end
  end

  describe "#edit" do
    it "正常に遷移できるか" do
      sign_in @user
      get :edit, params: {id: @post.id}
      expect(response).to be_success
    end
    it "200レスポンスが返ってきているか" do
      sign_in @user
      get :edit, params: {id: @post.id}
      expect(response).to have_http_status "200"
    end
  end

  describe "#update" do
    it "正常に記事を更新できるか" do
      sign_in @user
      post_params = {title: "テスト題名"}
      patch :update, params: {id: @post.id, post: post_params}
      expect(@post.reload.title).to eq "テスト題名"
    end
    it "記事更新後、投稿一覧ページにリダイレクトされるか" do
      sign_in @user
      post_params = {title: "テスト題名"}
      patch :update, params: {id: @post.id, post: post_params}
      expect(response).to redirect_to posts_path(@post.id)
    end
    # it "不正記事の場合、更新できなくなっているか" do
    #   sign_in @user
    #   post_params = {title: nil}
    #   patch :update, params: {id: @post.id, post: post_params}
    #   expect(@post.reload.title).to eq "テスト題名"
    # end
    it "不正記事の場合、作成ページにリダイレクトされるか" do
      sign_in @user
      post_params = {text: nil}
      patch :update, params: {id: @post.id, post: post_params}
      expect(response).to redirect_to edit_post_path(@post.id)
    end

    describe "#destroy" do
      it "正常に記事を削除できるか" do
        sign_in @user
        expect { 
          delete :destroy, params: {id: @post.id}}.to change(@user.posts, :count).by(-1)
      end
      # it "投稿したユーザーのみが記事を削除できるか" do
      #   sign_in @user
      #   another_post = @another_user.posts.create( title: "夜更に", text: "ひたすらテスト")
      #   expect {
      #     delete :destroy, params: {id: another_post.id}}.to_not change(@another_user.posts, :count)
      #   end

    end




  end




end