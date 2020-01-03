require 'rails_helper'

#describe User do
    #it "name.mail.passwordがあればvalid" do
        #user = User.new(
            #name: "wataru",
            #mail: "test@gmail.com",
            #password: "password")
            
        #expect(user.valid?).to eq true
    #end
#end


RSpec.describe User, type: :model do 
  before do 
    @user = build(:user)
  end

  describe "バリデーション" do
    it "nameとmailどちらも値が設定されていればOK" do
      expect(@user.valid?).to eq(true)
    end

    it "nameが空だとNG" do
      @user.name = ""
      expect(@user.valid?).to eq(false)
    end

    it "mailが空だとNG" do
      @user.mail = ""
      expect(@user.valid?).to eq(false)
    end
    
    it "passwordが空だとNG" do #すでにbuildで作ってある@userを使うと、on: :createに当てはまらない
        user = build(:user, password: "")
      expect(user.valid?).to eq(false)
    end
    
    it "mail被ってたらNG" do
        User.create(
          name: "John",
          mail: "test@example.com",
          password: "i-am-john"
          )

      another_user = build(:user, mail: "test@example.com")
      expect(another_user.valid?).to eq(false)
      
    end
  end
end