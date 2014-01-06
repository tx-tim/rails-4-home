class StaticPagesController < ApplicationController
  def home
    render layout: "tp_home"
  end

  def help
  end

  def about
  end
end
