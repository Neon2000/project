require "application_system_test_case"

class UsercommentratingsTest < ApplicationSystemTestCase
  setup do
    @usercommentrating = usercommentratings(:one)
  end

  test "visiting the index" do
    visit usercommentratings_url
    assert_selector "h1", text: "Usercommentratings"
  end

  test "creating a Usercommentrating" do
    visit usercommentratings_url
    click_on "New Usercommentrating"

    fill_in "Star", with: @usercommentrating.star
    click_on "Create Usercommentrating"

    assert_text "Usercommentrating was successfully created"
    click_on "Back"
  end

  test "updating a Usercommentrating" do
    visit usercommentratings_url
    click_on "Edit", match: :first

    fill_in "Star", with: @usercommentrating.star
    click_on "Update Usercommentrating"

    assert_text "Usercommentrating was successfully updated"
    click_on "Back"
  end

  test "destroying a Usercommentrating" do
    visit usercommentratings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Usercommentrating was successfully destroyed"
  end
end
