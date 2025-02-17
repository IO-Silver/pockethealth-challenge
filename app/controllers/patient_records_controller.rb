class PatientRecordsController < ApplicationController
  def headers
    record = PatientRecord.find(params[:id])
    render json: record.get_tag_value(params[:tag]) if record
  end

  def image
    record = PatientRecord.find(params[:id])
    send_file record.get_image if record
  end

  def create
    record = PatientRecord.create!(id: UUID4.new, dicom: record_params[:dicom])
    render plain: record.id, status: :created
  end

  def record_params
    params.permit(:dicom)
  end
end
