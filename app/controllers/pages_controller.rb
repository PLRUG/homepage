class PagesController < ApplicationController
  def home
    contact_request = ContactRequest.new
    discord_gateway = DiscordGateway.new

    render :home, locals: { contact_request: contact_request, discord_gateway: discord_gateway }
  end
end
