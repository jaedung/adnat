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
    organisation.destroy!

    redirect_to "/"
  end

  def shifts

    organisation = Organisation.find(params[:id])

    shifts = organisation.shifts
    .includes(:user)
    .order(start: :desc)

    shifts = shifts.map do |shift|

      shift_hours = TimeDifference.between(shift.finish, shift.start).in_hours
      break_hours = (shift.break_length / 60.to_f).round
      hours_worked = (shift_hours - break_hours).round
      cost = (hours_worked * organisation.hourly_rate).round

      {
        name: shift.user.name,
        date: shift.start.strftime("%d/%m/%Y"),
        start: shift.start.strftime("%-l:%M %P"),
        finish: shift.finish.strftime("%-l:%M %P"),
        break_length: shift.break_length,
        hours_worked: hours_worked,
        cost: cost
      }
    end

    @response = {
      id: organisation.id,
      name: organisation.name,
      hourly_rate: organisation.hourly_rate,
      shifts: shifts
    }
  end

  def create_shift

    start = (params[:date] + " " + params[:start]).to_datetime
    finish = (params[:date] + " " + params[:finish]).to_datetime

    Shift.create!(
      user_id: current_user.id,
      organisation_id: params[:id],
      start: start,
      finish: finish,
      break_length: params[:break_length]
    )

    redirect_to "/organisations/#{params[:id]}/shifts"
  end

end
