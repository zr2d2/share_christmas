class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  layout 'org_admin'

  def show
    @org = Organization.friendly.find(params[:id])
    session[:current_campaign] ||= Campaign.current_campaign_id(params[:id])
    if session[:current_campaign]
      @organization_campaign = OrganizationCampaign.where(
        organization_id: @org.id,
        campaign_id: session[:current_campaign]
      ).first
    else
      @organization_campaign = nil
    end
    @joined_campaigns = Campaign.joined_by(@org.id)
    @joinable_campaigns = Campaign.joinable_by(@org.id)
    @organization_campaign_new = OrganizationCampaign.new(organization_id: @org.id)
  end

  def switch_current_campaign
    session[:current_campaign] = params[:organization_campaign][:campaign_id]
    redirect_to organization_path(params[:id])
  end
end
