require 'spec_helper'


describe "Authentication Pages via Sessions Controller" do
	
	subject { page }

	describe "Signin Page" do
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

		describe "Successful Sign In" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email", with: user.email.upcase
				fill_in "Password", with: user.password
				click_button submit
			end

			it { should have_title(user.name) }
			it { should have_link('Signout', href: signout_path) }
		end

	end


	describe "Signout Page" do
		before { visit signout_path }
		it { should have_content("Sign Out")}
	end
end
