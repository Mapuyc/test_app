require 'spec_helper'

feature 'Posting Comments' do
  background do
    @post = Post.create(:body => 'Lorem ipsum dolor sit amet')
    @posts = Post.all
  end

  scenario 'Posting a comment' do
    visit posts_path(@posts)

    fill_in "comment_body", :with => "testvalue"
    click_button("Comment")
    page.has_content?("testvalue")
    
  end
end