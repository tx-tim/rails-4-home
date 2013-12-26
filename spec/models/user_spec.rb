require 'spec_helper'

describe User do
	before { @user = User.new(name: "test", email: "foo@bar.com", password: "foobar", password_confirmation: "foobar") }

	subject { @user }
	
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate)}
	it { should respond_to(:remember_token) }
	it { should respond_to(:admin) }

	it { should be_valid }

	describe "when name is not present" do
		before { @user.name = "" }

		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @user.name = "a" * 51 }

		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = "" }

		it { should_not be_valid }
	end

	describe "when email format is not valid" do
		it "should not be valid" do
			#iterate over a collection of invalid email addresses?
			addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				expect(@user).not_to be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			#iterate over a collection of invalid email addresses?
			addresses = %w[user@foo.com user@foo.COM user@foo.bar.org]
			addresses.each do |valid_address|
				@user.email = valid_address
				expect(@user).to be_valid
			end
		end
	end

	describe "when email is not unique" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it { should_not be_valid }
	end

	describe "when password is blank" do
		before do
		    @user = User.new(name: "Example User", email: "user@example.com",
                 password: " ", password_confirmation: " ")
		end

		it { should_not be_valid }
	end

	describe "when password is less than 5 chars" do
		before { @user.password = @user.password_confirmation = 'a' * 5 }
		it { should_not be_valid }
	end



	describe "when password doesn't match password_confirmation" do
		before do
			@user.password_confirmation = "mismatch"
		end

		it { should_not be_valid }
	end

	describe "return value of authenticate method" do

		before { @user.save }
		let(:found_user) { User.find_by(email: @user.email) }

		describe "when user logs in with valid password" do
			it { should eq found_user.authenticate(@user.password) }
		end

		describe "when user logs in with invalid password" do
			let(:user_with_invalid_password) { found_user.authenticate("invalid")}
			it { should_not eq user_with_invalid_password }
			specify { expect(user_with_invalid_password).to be_false }
		end
	end

	describe "remember token" do
		before { @user.save }

		describe "when user is created" do
			its(:remember_token) { should_not be_blank }
		end
	end


end
