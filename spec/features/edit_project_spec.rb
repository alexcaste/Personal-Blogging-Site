require 'rails_helper'

describe "the edit a project process" do
  it "edits a project" do
    skill = Skill.create(:name => 'This Sucks', :description => 'Wish I had read the instructions better')
    visit skill_path(skill)
    click_on 'Add a Project'
    fill_in 'Name', :with => 'Blah Blah'
    fill_in 'Description', :with => 'Still stupid'
    fill_in 'Link', :with => 'yep hate this'
    click_on 'Create Project'
    click_on 'Blah Blah'
    click_on 'Edit'
    fill_in 'Name', :with => 'whatever'
    click_on 'Update Project'
    expect(page).to have_content 'whatever'
  end
end
