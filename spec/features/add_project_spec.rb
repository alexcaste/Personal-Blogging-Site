require 'rails_helper'

describe "the add a project process" do
  it "adds a new project" do
    user = FactoryGirl.create(:user, admin: true)
    skill = FactoryGirl.create(:skill, user_id: user.id)
    user.skills.push(skill)
    login(user)
    visit skill_path(skill)
    click_on 'add-project'
    fill_in 'name', :with => 'Blah Blah'
    fill_in 'description', :with => 'Still stupid'
    fill_in 'link', :with => 'yep hate this'
    click_on 'submit-project'
    expect(page).to have_content 'Blah Blah'
  end

  it "gives error message when not field not filled in" do
    user = FactoryGirl.create(:user, admin: true)
    skill = FactoryGirl.create(:skill)
    user.skills.push(skill)
    login(user)
    visit skill_path(skill)
    click_on 'add-project'
    fill_in 'name', :with => 'Blah Blah'
    fill_in 'description', :with => 'Still stupid'
    click_on 'submit-project'
    expect(page).to have_content "Sorry, you've made the following errors"
  end

end
