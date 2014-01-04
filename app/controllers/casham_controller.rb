class CashamController < ApplicationController
  
  http_basic_authenticate_with name: "dhh", password: "secret" 

  def one_col
  end
end
