class ShiftsController < ApplicationController

  before_action :authenticate_user!

  def index

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
        id: shift.id,
        organisation_id: shift.organisation_id,
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

  def new

    organisation = Organisation.find(params[:id])

    @response = {
      id: organisation.id,
      name: organisation.name
    }
  end

  def create

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

  def edit

    shift = Shift.find(params[:id])

    @response = {
      id: shift.id,
      organisation_id: shift.organisation_id,
      name: shift.organisation.name,
      date: shift.start.strftime("%d/%m/%Y"),
      start: shift.start.strftime("%-I:%M %P"),
      finish: shift.finish.strftime("%-I:%M %P"),
      break_length: shift.break_length
    }
  end

  def update

    start = (params[:date] + " " + params[:start]).to_datetime
    finish = (params[:date] + " " + params[:finish]).to_datetime

    shift = Shift.find(params[:id])
    shift.update!(
      start: start,
      finish: finish,
      break_length: params[:break_length]
    )

    redirect_to "/organisations/#{params[:organisation_id]}/shifts"
  end

  def destroy

    shift = Shift.find(params[:id])
    shift.destroy!

    redirect_to "/organisations/#{params[:organisation_id]}/shifts"
  end

end
