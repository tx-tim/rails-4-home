require 'spec_helper'

describe "UserPages" do

  subject { page }

  describe "Signup New" do
    before { visit signup_path }
    let(:submit) { "Create Account"}

  	it "should have the content signup" do
  		visit signup_path
  		expect(page).to have_content("Signup")
  	end

    describe "With Invalid INformation" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "With Valid Information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "foo@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a new user" do
        expect { click_button submit}.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'foo@example.com') }

        it { should have_link('Sign Out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }

        describe "followed by signout" do
          before { click_link "Sign Out" }
          it { should have_link('Sign In') }
        end
      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end
end
