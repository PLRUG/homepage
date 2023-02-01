class PagesController < ApplicationController
  def home
    contact_request = ContactRequest.new

    render :home, locals: { contact_request: contact_request }
  end
end
