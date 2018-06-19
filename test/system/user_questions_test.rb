require "application_system_test_case"

class UserQuestionsTest < ApplicationSystemTestCase
  setup do
    @user_question = user_questions(:one)
  end

  test "visiting the index" do
    visit user_questions_url
    assert_selector "h1", text: "User Questions"
  end

  test "creating a User question" do
    visit user_questions_url
    click_on "New User Question"

    fill_in "Question Num", with: @user_question.question_num
    fill_in "Recipient Choice", with: @user_question.recipient_choice
    click_on "Create User question"

    assert_text "User question was successfully created"
    click_on "Back"
  end

  test "updating a User question" do
    visit user_questions_url
    click_on "Edit", match: :first

    fill_in "Question Num", with: @user_question.question_num
    fill_in "Recipient Choice", with: @user_question.recipient_choice
    click_on "Update User question"

    assert_text "User question was successfully updated"
    click_on "Back"
  end

  test "destroying a User question" do
    visit user_questions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User question was successfully destroyed"
  end
end
