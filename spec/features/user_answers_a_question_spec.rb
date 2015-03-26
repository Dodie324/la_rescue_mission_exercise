require 'rails_helper'

feature 'user answers a questions', %Q{
  As a user
  I want to answer another user's question
  So that I can help them solve their problem
# } do
  # Acceptance Criteria

  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario 'user post an answer' do
    answer_description = 'The ' * 50

    visit root_path

    click_link "Sign up"

    fill_in "Username", with: "test1234"
    fill_in "Email", with: "test@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    click_link 'CSV as a data source for Crystal Reports - change in column names'
    # click_link question_path(6)

    fill_in('_submit an answer', with:('The ' * 50))

    click_button '_submit'

    expect(page).to have_content('Answer saved!')
    expect(page).to have_content(answer_description)
  end

end
