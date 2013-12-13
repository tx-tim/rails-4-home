require 'spec_helper'

describe "Static Pages" do
  describe "Home Page" do
    it "should have the content Home Page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit root_path
      expect(page).to have_content("Home Page")
    end
  end

  describe "About Page" do
  	it "should have the content About" do
  		visit static_pages_about_path
  		expect(page).to have_content("About")
  	end
  end
end
