require 'rails_helper'

describe UsersController, type: :controller do
    describe 'GET #new' do
      it "新規登録へ移動する" do
          get :new
          expect(response).to render_template :new
      end
    end
end