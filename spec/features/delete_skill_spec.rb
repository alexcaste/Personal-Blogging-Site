require 'rails_helper'

describe "the delete a skill process" do
  it "deletes a skill" do
    skill = Skill.create(:name => 'Fuck!', :description => 'Hungry!')
    visit skill_path(skill)
    click_on 'Delete'
    expect(page).to have_content 'Alexandar'
  end
end
