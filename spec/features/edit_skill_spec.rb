require 'rails_helper'

describe "the edit a skill process" do
  it "edits a skill" do
    user = FactoryGirl.create(:user, admin: true)
    skill = FactoryGirl.create(:skill, user_id: user.id)
    user.skills.push(skill)
    login(user)
    visit skill_path(skill)
    click_on 'edit'
    fill_in 'name', :with => 'Bullshit'
    click_on 'submit-skill'
    expect(page).to have_content 'Bullshit'
  end
end
