require 'rails_helper'

describe "the edit a skill process" do
  it "edits a skill" do
    skill = Skill.create(:name => 'This Sucks', :description => 'Wish I had read the instructions better')
    visit skill_path(skill)
    click_on 'Edit'
    fill_in 'Name', :with => 'Bullshit'
    click_on 'Update Skill'
    expect(page).to have_content 'Bullshit'
  end
end
