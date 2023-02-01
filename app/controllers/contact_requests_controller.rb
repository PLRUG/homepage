class ContactRequestsController < ApplicationController
  def create
    contact_request = ContactRequest.new(contact_request_params)

    if contact_request.save
      redirect_to root_path, notice: 'Your message has been sent.'
    else
      render 'pages/home', contact_request: contact_request
    end
  end

  private

  def contact_request_params
    params.require(:contact_request).permit(:name, :email, :message)
  end
end
