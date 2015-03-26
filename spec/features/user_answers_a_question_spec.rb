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


    click_link "_new question"
    fill_in "Title", with: "Germanwings plane crash: Co-pilot wanted to destroy plane"
    fill_in "Description", with: "We hear the pilot ask the co-pilot to take
    control of the plane and we hear at the same time the sound of a seat moving
    backwards and the sound of a door closing, Mr Robin told reporters.
    He said the pilot, named in the German media as Patrick S, had probably gone to the toilet.
    At that moment, the co-pilot is controlling the plane by himself. While he is alone,
    the co-pilot presses the buttons of the flight monitoring system to put into action the descent of the aeroplane."

    click_button "Add Question"

    fill_in('_submit an answer', with: answer_description)

    click_button '_submit'

    expect(page).to have_content('Answer saved!')
    expect(page).to have_content(answer_description)
  end

end
