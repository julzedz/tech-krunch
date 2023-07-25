require 'rails_helper'

RSpec.describe 'User Index', type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:user1) { User.create(name: 'Mike', photo: 'https://example.com/mike.jpg', posts_counter: 1) }
  let!(:user2) { User.create(name: 'Tom', photo: 'https://example.com/tom.jpg', posts_counter: 3) }

  it 'displays the username of all other users' do
    visit users_path

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end

  it 'displays the profile picture for each user' do
    visit users_path

    expect(page).to have_css("img[src='#{user1.photo}']")
    expect(page).to have_css("img[src='#{user2.photo}']")
  end

  it 'displays the number of posts each user has written' do
    visit users_path

    expect(page).to have_content(" #{user1.posts_counter}")
    expect(page).to have_content(" #{user2.posts_counter}")
  end

  it 'redirects to a user\'s show page when clicking on a user' do
    visit users_path

    click_link user1.name
    expect(page).to have_current_path(user_path(user1))
  end
end
