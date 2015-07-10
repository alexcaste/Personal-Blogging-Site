require 'rails_helper'

describe "the add a skill process" do
  it "adds a new skill" do
    user = FactoryGirl.create(:user, admin: true)
    skill = FactoryGirl.create(:skill, user_id: user.id)
    user.skills.push(skill)
    login(user)
    visit skills_path
    click_on 'add-skills'
    fill_in 'name', :with => 'Skill 1'
    fill_in 'description', :with => 'Stupid test'
    click_on 'submit-skill'
    expect(page).to have_content 'Skill 1'
  end

  it "gives error message when not field not filled in" do
    user = FactoryGirl.create(:user, admin: true)
    skill = FactoryGirl.create(:skill, user_id: user.id)
    user.skills.push(skill)
    login(user)

    visit skills_path
    click_on 'add-skills'
    fill_in 'name', :with => 'Skill 1'
    click_on 'submit-skill'
    expect(page).to have_content "Sorry, you've made the following errors"
  end

end
