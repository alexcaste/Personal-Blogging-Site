require 'rails_helper'

describe "the edit a post process" do
  it "add a new post" do
    user = FactoryGirl.create(:user)
    login(user)
    visit new_post_path
    fill_in 'Title', :with => 'Blah Blah'
    fill_in 'Body', :with => 'melons are melony'
    click_on 'Create Post'
    expect(page).to have_content 'Blah Blah'
  end

  it "errors when field not filled" do
    user = FactoryGirl.create(:user)
    login(user)
    visit new_post_path
    fill_in 'Title', :with => 'Blah Blah'
    click_on 'Create Post'
    expect(page).to have_content "Sorry, you've made the following errors"
  end

  it "edits a  post" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user_id: user.id)
    user.posts.push(post)
    login(user)
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Title', :with => 'Blah Blah'
    click_on 'Update Post'
    expect(page).to have_content 'Blah Blah'
  end

  it "deletes a post" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user_id: user.id)
    user.posts.push(post)
    login(user)
    visit post_path(post)
    click_on 'Delete'
    expect(page).to have_content 'Alexandar Castaneda'
  end

end
