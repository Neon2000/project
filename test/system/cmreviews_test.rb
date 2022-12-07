require "application_system_test_case"

class CmreviewsTest < ApplicationSystemTestCase
  setup do
    @cmreview = cmreviews(:one)
  end

  test "visiting the index" do
    visit cmreviews_url
    assert_selector "h1", text: "Cmreviews"
  end

  test "creating a Cmreview" do
    visit cmreviews_url
    click_on "New Cmreview"

    fill_in "Star", with: @cmreview.star
    click_on "Create Cmreview"

    assert_text "Cmreview was successfully created"
    click_on "Back"
  end

  test "updating a Cmreview" do
    visit cmreviews_url
    click_on "Edit", match: :first

    fill_in "Star", with: @cmreview.star
    click_on "Update Cmreview"

    assert_text "Cmreview was successfully updated"
    click_on "Back"
  end

  test "destroying a Cmreview" do
    visit cmreviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cmreview was successfully destroyed"
  end
end
