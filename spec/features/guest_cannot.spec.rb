require 'spec_helper'

feature 'Guests cannot create' do 
	
  scenario 'Guests cannot create posts' do
    visit posts_path

    click_link "Sign Out"
    visit posts_path
    expect(page).to have_no_content "Create"
    
  end
end  