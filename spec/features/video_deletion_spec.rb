require 'rails_helper'

RSpec.feature 'New video', :type => :feature do
 User.create(name: "test_user",
             password: "password",
             password_confirmation: "password")

  scenario "User can delete a video" do
   visit signin_path
   fill_in "user[name]", :with => "test_user"
   fill_in "user[password]", :with => "password"
   click_on "Sign In"

    visit "/videos/new"
      fill_in "video_title", :with => "Test Title"
      fill_in "video_url", :with => "https://www.youtube.com/watch?v=ckpwSAv5we8"
      click_button "Create Video"

      click_on "Delete Video"

      expect(page).not_to have_text("Test Title")
  end

end