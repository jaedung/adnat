class OrganisationsController < ApplicationController

  before_action :authenticate_user!

  def join

    current_user.update!(organisation_id: params[:id])
    redirect_to "/"
  end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def leave

    current_user.update!(organisation_id: nil)
    redirect_to "/"
  end

  def create

    Organisation.create!(
      name: params[:name],
      hourly_rate: params[:hourly_rate]
    )

    redirect_to "/"
  end

  def update

    organisation = Organisation.find(params[:id])
    organisation.update!(
      name: params[:name],
      hourly_rate: params[:hourly_rate]
    )

    redirect_to "/"
  end

  def destroy

    organisation = Organisation.find(params[:id])

    organisation.shifts.destroy_all
    organisation.destroy!

    redirect_to "/"
  end

end
