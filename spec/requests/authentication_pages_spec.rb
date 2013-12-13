require 'spec_helper'


describe "Authentication" do
	
	subject { page }

	describe "Signin" do
		before { visit signin_path }
		let(:submit){ "Sign In"}

		it { should have_content("Sign In")}

		describe "Failed Signin" do
			before { click_button submit }

			it { should have_content('Sign In') }
			it { should have_selector('div.alert.alert-error')}

			describe "after visiting another page" do
				before { click_link "Home" }

				it { should_not have_selector('div.alert.alert-error')}
			end
		end

		describe "with valid signin" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email", with: user.email.upcase
				fill_in "Password", with: user.password
				click_button submit
			end

			it { should have_title(user.name) }
			it { should have_link('Sign Out', href: signout_path) }
			it { should have_link('Profile', href: user_path(user)) }

			describe "followed by signout" do
		       before { click_link "Sign Out" }
		       it { should have_link('Sign In') }
		    end
		end
	end
end
