require "application_system_test_case"

class RecipientsTest < ApplicationSystemTestCase
  setup do
    @recipient = recipients(:one)
  end

  test "visiting the index" do
    visit recipients_url
    assert_selector "h1", text: "Recipients"
  end

  test "creating a Recipient" do
    visit recipients_url
    click_on "New Recipient"

    fill_in "Food Access", with: @recipient.food_access
    fill_in "Income Level", with: @recipient.income_level
    fill_in "Last Donation", with: @recipient.last_donation
    fill_in "Organization Size", with: @recipient.organization_size
    fill_in "Poverty Level", with: @recipient.poverty_level
    fill_in "Total Donation", with: @recipient.total_donation
    fill_in "Travel Time", with: @recipient.travel_time
    click_on "Create Recipient"

    assert_text "Recipient was successfully created"
    click_on "Back"
  end

  test "updating a Recipient" do
    visit recipients_url
    click_on "Edit", match: :first

    fill_in "Food Access", with: @recipient.food_access
    fill_in "Income Level", with: @recipient.income_level
    fill_in "Last Donation", with: @recipient.last_donation
    fill_in "Organization Size", with: @recipient.organization_size
    fill_in "Poverty Level", with: @recipient.poverty_level
    fill_in "Total Donation", with: @recipient.total_donation
    fill_in "Travel Time", with: @recipient.travel_time
    click_on "Update Recipient"

    assert_text "Recipient was successfully updated"
    click_on "Back"
  end

  test "destroying a Recipient" do
    visit recipients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recipient was successfully destroyed"
  end
end
