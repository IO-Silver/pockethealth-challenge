require 'dicom'
include DICOM

class PatientRecord < ApplicationRecord
  has_one_attached :dicom

  # If the record has the tag, return it
  # Otherwise, return nil
  def get_tag_value(tag)
    byebug
    dcm = DObject.read(get_dicom_path)
    unless dcm[tag].nil?
      return dcm[tag].value
    else
      return nil
    end
  end

  def get_dicom_path
    byebug
    ActiveStorage::Blob.service.path_for(dicom.key)
  end
end
