require 'rails_helper'

describe UsersController, type: :controller do
  before do 
    @user = build(:user)
    @post = build(:post)
    @like = build(:like)
  end
  
    describe "#new" do
      it "新規登録へ移動する" do
          get :new
          expect(response).to render_template :new
      end

      #it "へ移動する" do
          #get :
          #expect(response).to render_template :
          #end
    end
    

  #describe "#edit" do
    #context "別ユーザーのユーザ情報を編集しようとした場合" do
      
      #before do
       #@other_user = build(:user) 
      #end

      #it "homeに戻す" do
        #sign_in @user
        #get :edit, params: { id: @other_user.id }
        #expect(response).to redirect_to "http://test.host/"
      #end
    #end 
  #end
  
end

#describeは機能のテスト書くとき
#contextは状態のテスト書くとき使う