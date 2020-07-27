require 'rails_helper'

RSpec.describe TopController, type: :controller do
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
end