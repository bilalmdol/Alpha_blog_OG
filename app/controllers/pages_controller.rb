class PagesController < ApplicationController
  def home
    redirect_to articles_path if isLoggedIn?
  end

  def about
  end
end
