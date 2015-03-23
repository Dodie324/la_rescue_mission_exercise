require 'rails_helper'

feature 'user posts a questions', %Q{
  As a user
  I want to post a question
  So that I can receive help from others
# } do
  # Acceptance Criteria

  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario 'user posts a question' do
    user = User.create!(username: "RoccStar", email: "rocc@example.com", password: "asdfjkl;")
    question_title = "I'm noob and I don't know anything about programming"
    question_description = "Use Git to save the state of your code each time you complete a user story (or more often if it's a complex user story).
    Try using Git branches to store all commits related to a particular feature and then merge back into master when the feature is complete."
    visit new_question_path

    fill_in 'Title', with: question_title
    fill_in 'Description', with: question_description

    click_button 'Add Question'

    expect(page).to have_content('Question added!')
    expect(page).to have_content(question_title)
    expect(page).to have_content(question_description)
  end

end
