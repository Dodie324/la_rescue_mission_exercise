require 'rails_helper'

feature 'user views questions', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
# } do
#   Acceptance Criteria

# - I must see the title of each question
# - I must see questions listed in order, most recently posted first
  scenario 'user views recently posted questions' do
    user = User.create!(username: "RoccStar", email: "rocc@example.com", password: "asdfjkl;")
    Question.create!(title: "I'm a noob and I don't know anything about programmingI'm a noob and I don't know anything about programming", description: "If you want to validate that an email is correct, you have no choice than to
      send an confirmation email and have the user reply to that. In many cases you will have to send a confirmation mail anyway for security reasons or for ethical reasons
      (so you cannot e.g. sign someone up to a service against their will).(so you cannot e.g. sign someone up to a service against their will).(so you cannot e.g. sign someone up to a service against their will).", user_id: user.id)
    visit '/'
    expect(page).to have_content(Question.first.title)
  end


end
