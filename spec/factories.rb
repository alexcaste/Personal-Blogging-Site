FactoryGirl.define do
  factory :user do
     first_name 'Data'
     last_name 'Lore'
     email 'loreknows@gmail.com'
     password '12345678'
     password_confirmation '12345678'
   end

  factory(:skill) do
    name 'making tests pass rspec takes longer than writing the code'
    description 'while i understand the need for testing i find it very silly that i spend more time making a test pass rspec and capybaras idiosyncrasies than actually writing code.  I was done 2 hours ago with working code and yet here i still am writing these'
  end

  factory(:project) do
    name 'money'
    description 'i dont know if rspec and capybara are mature enough for people to be relying on them so much.'
    link 'mygripe@complaint.com'
  end
end
