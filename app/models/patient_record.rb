require 'dicom'
include DICOM

class PatientRecord < ApplicationRecord
  has_one_attached :dicom

  # If the record has the tag, return it
  # Otherwise, return nil
  def get_tag_value(tag)
    dcm = DObject.read(get_dicom_path)
    unless dcm[tag].nil?
      # Rails doesn't like rendering numbers
      return dcm[tag].value
    else
      return nil
    end
  end

  def get_dicom_path
    ActiveStorage::Blob.service.path_for(dicom.key)
  end
end
