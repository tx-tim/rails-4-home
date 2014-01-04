require 'spec_helper'

describe CashamController do

  describe "GET 'one_col'" do
    it "returns http success" do
      get 'one_col'
      response.should be_success
    end
  end

end
