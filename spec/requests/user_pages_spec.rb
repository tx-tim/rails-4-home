require 'spec_helper'

describe "UserPages" do
  describe "user pages" do
  	it "should return 200" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get signup_path
      response.status.should be(200)
    end
  end

  describe "User New" do
  	it "should have the content signup" do
  		visit signup_path
  		expect(page).to have_content("Signup")
  	end
  end
end
