class PagesController < ApplicationController
  def home
    @countries = Country.all
  end

  def about_us

  end
end
