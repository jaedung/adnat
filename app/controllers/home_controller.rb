class HomeController < ApplicationController

  def index

    if user_signed_in? == true

      # if the current user does not belong to an organisation, show all
      # registered organisations that the user can join.
      if current_user.organisation_id == nil
        @organisations = Organisation.all
      end

      # if the current user belongs to an organisation, show the organisation
      # detail page.
      if current_user.organisation_id != nil
        @organisation = Organisation.find(current_user.organisation_id)
        @users = @organisation.users.length
        @shifts = @organisation.shifts.length
      end
    end
  end

end
