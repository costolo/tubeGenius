require 'rails_helper'

RSpec.feature 'Delete a video', :type => :feature do
  let!(:user) { create(:user) }
  let!(:video) { create(:video) }
  let!(:video_permission) { create(:video, :user_id => 10) }

  scenario "User cannot delete a video if they do not own it" do
    page.set_rack_session(user_id: user.id)

    visit video_path(video_permission)
    expect(page).not_to have_text("Delete Video")
  end

  scenario "User can delete a video they own" do
   page.set_rack_session(user_id: user.id)

   visit video_path(video)
   expect(page).to have_text("Delete Video")
  end

end