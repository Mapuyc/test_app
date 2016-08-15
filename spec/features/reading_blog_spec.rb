require 'spec_helper'

feature 'Reading the Blog' do
  background do
    @post = Post.create(:body => 'Lorem ipsum dolor sit amet')
    Post.create(:body => 'Lorem ipsum dolor sit amet')
  end

  scenario 'Reading the blog index' do
    visit posts_path

    expect(page).to have_content 'Lorem ipsum dolor sit amet'
    
  end

  scenario 'Reading home page' do
    visit root_path
    click_link 'Guest access'

    expect(current_path).to eq posts_path
  end
end