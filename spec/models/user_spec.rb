require 'rails_helper'

describe User do
    it "name.mail.passwordがあればvalid" do
        user = User.new(
            name: "wataru",
            mail: "test@gmail.com",
            password: "password")
            
        expect(user.valid?).to eq true
    end
    #it "name.mail.passwordがなければinvalid"
end