require 'rails_helper'
RSpec.describe Post, type: :model do 

  before do 
    @post = build(:post)
  end
  
  it "タイトルなしだとNG" do
      @post = build(:post, title: "")
      expect(@post.valid?).to eq(false)
  end
  
  it "コンテントなしだとNG" do
      @post = build(:post, content: "")
      expect(@post.valid?).to eq(false)
  end

end