require 'rails_helper'

feature 'user views specific question', %Q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question
# } do
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  scenario 'user visits specific question' do
    user = User.create!(username: "RoccStar", email: "rocc@example.com", password: "asdfjkl;")
    question = Question.create!(title: "I'm a noob and I don't know anything about programmingI'm a noob and I don't know anything about programming", description: "If you want to validate that an email is correct, you have no choice than to
      send an confirmation email and have the user reply to that. In many cases you will have to send a confirmation mail anyway for security reasons or for ethical reasons
      (so you cannot e.g. sign someone up to a service against their will).(so you cannot e.g. sign someone up to a service against their will).(so you cannot e.g. sign someone up to a service against their will).", user_id: user.id)
    visit question_path(question)
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end
end
