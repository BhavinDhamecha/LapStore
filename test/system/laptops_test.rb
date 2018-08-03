require "application_system_test_case"

class LaptopsTest < ApplicationSystemTestCase
  setup do
    @laptop = laptops(:one)
  end

  test "visiting the index" do
    visit laptops_url
    assert_selector "h1", text: "Laptops"
  end

  test "creating a Laptop" do
    visit laptops_url
    click_on "New Laptop"

    fill_in "Available", with: @laptop.available
    fill_in "Brand", with: @laptop.brand_id
    fill_in "Graphics Card", with: @laptop.graphics_card
    fill_in "Hdd", with: @laptop.hdd
    fill_in "Hdmi Port", with: @laptop.hdmi_port
    fill_in "Model Number", with: @laptop.model_number
    fill_in "Name", with: @laptop.name
    fill_in "Processor", with: @laptop.processor
    fill_in "Ram", with: @laptop.ram
    fill_in "Screen", with: @laptop.screen
    fill_in "Serial Number", with: @laptop.serial_number
    fill_in "Usb Port", with: @laptop.usb_port
    fill_in "Weight", with: @laptop.weight
    click_on "Create Laptop"

    assert_text "Laptop was successfully created"
    click_on "Back"
  end

  test "updating a Laptop" do
    visit laptops_url
    click_on "Edit", match: :first

    fill_in "Available", with: @laptop.available
    fill_in "Brand", with: @laptop.brand_id
    fill_in "Graphics Card", with: @laptop.graphics_card
    fill_in "Hdd", with: @laptop.hdd
    fill_in "Hdmi Port", with: @laptop.hdmi_port
    fill_in "Model Number", with: @laptop.model_number
    fill_in "Name", with: @laptop.name
    fill_in "Processor", with: @laptop.processor
    fill_in "Ram", with: @laptop.ram
    fill_in "Screen", with: @laptop.screen
    fill_in "Serial Number", with: @laptop.serial_number
    fill_in "Usb Port", with: @laptop.usb_port
    fill_in "Weight", with: @laptop.weight
    click_on "Update Laptop"

    assert_text "Laptop was successfully updated"
    click_on "Back"
  end

  test "destroying a Laptop" do
    visit laptops_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Laptop was successfully destroyed"
  end
end
