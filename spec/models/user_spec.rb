#ENV['RAILS_ENV'] ||= 'test'
#require File.expand_path('../config/environment', __dir__)
require 'rails_helper'

describe User do
    it "name.mail.passwordがあればvalid" do
        user = User.new(
            name: "wataru",
            mail: "test@gmail.com",
            password: "password")
            
        expect(user.valid?).to eq true
    end
end


RSpec.describe User, type: :model do #Rspec type: :model doの記述は要らないか
  before do 
    @user = build(:user)
  end

  describe 'バリデーション' do
    it 'nameとemailどちらも値が設定されていれば、OK' do
      expect(@user.valid?).to eq(true)
    end

    #it 'nameが空だとNG' do
      #@user.name = ''
      #expect(@user.valid?).to eq(false)
    #end

    #it 'emailが空だとNG' do
      #@user.email = ''
      #expect(@user.valid?).to eq(false)
    #end
  end
end