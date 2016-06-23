class UsersController < ApplicationController
  before_action :authenticate_user!

  def styleguide
    @user = User.new
  end

  def show
    @memberships = current_user.memberships.includes(recipients: { organization_campaign: :campaign })
    if !@memberships.empty?
      # TODO: I'd like to clean this up
      @campaign_date = @memberships.first.recipients.first.organization_campaign.campaign.donation_deadline
    else
      @campaign_date = Date.today
    end
  end
end
