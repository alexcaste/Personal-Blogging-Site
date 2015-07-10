require 'rails_helper'

describe "the edit a project process" do
  it "edits a project" do
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

    click_on 'Blah Blah'
    click_on 'edit'
    fill_in 'name', :with => 'whatever'
    click_on 'submit-project'
    expect(page).to have_content 'whatever'
  end
end
