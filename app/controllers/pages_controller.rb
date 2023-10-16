class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @varint = 1
  
    @toto = "titit"

    @userconnectmail = current_user.email

  end
end
