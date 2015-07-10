require 'rails_helper'

describe "the delete a project process" do
  it "deletes a project" do
    user = FactoryGirl.create(:user, admin: true)
    skill = FactoryGirl.create(:skill, user_id: user.id)
    project = FactoryGirl.create(:project, skill_id: skill.id)
    user.skills.push(skill)
    skill.projects.push(project)
    login(user)

    visit skill_project_path(skill, project)
    click_on 'Delete'
    expect(page).to have_content skill.name
  end
end
