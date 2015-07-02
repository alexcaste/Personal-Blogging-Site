require 'rails_helper'

describe "the add a project process" do
  it "adds a new project" do
    skill = Skill.create(:name => 'This Sucks', :description => 'Wish I had read the instructions better')
    visit skill_path(skill)
    click_on 'Add a Project'
    fill_in 'Name', :with => 'Blah Blah'
    fill_in 'Description', :with => 'Still stupid'
    fill_in 'Link', :with => 'yep hate this'
    click_on 'Create Project'
    expect(page).to have_content 'Blah Blah'
  end
end
