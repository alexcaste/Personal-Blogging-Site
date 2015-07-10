require 'rails_helper'

describe "the delete a skill process" do
  it "deletes a skill" do
    user = FactoryGirl.create(:user, admin: true)
    skill = FactoryGirl.create(:skill, user_id: user.id)
    user.skills.push(skill)
    login(user)
    visit skill_path(skill)
    click_on 'delete'
    expect(page).to have_content 'Alexandar'
  end
end
