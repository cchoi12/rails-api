class V1::DoctorsController < ApplicationController
  before_action :setup_doctors, only: [:index]
  before_action :setup_doctor, only: [:show]

  def index
    json_response(@doctors)
  end

  def show
    json_response(@doctor)
  end

  private

  def setup_doctors
    @doctors = Doctor.all
  end

  def setup_doctor
    @doctor = Doctor.find(params[:id])
  end
end
