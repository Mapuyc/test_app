require 'spec_helper'

feature 'Managing blog posts' do
  
  scenario 'Posting a new blog' do
    visit posts_path

    page.should have_selector("input[type=submit][id='submit-comment']")
    
    fill_in 'body', :with => "It's pretty amazing, don't you think?"

    click_button 'Create'

    expect(page).to have_content "It's pretty amazing, don't you think?"
  end

  context 'with an existing blog post' do
    background do
      @post = Post.create(:body => 'Lorem ipsum dolor sit amet')
      @posts = Post.all
    end

    scenario 'Editing an existing blog' do
      visit posts_path(@posts)
    
      fill_in 'body', :with => 'Not really Awesome Blog Post'
      click_button 'Edit'

      expect(page).to have_content 'Not really Awesome Blog Post'
    end
  end
end