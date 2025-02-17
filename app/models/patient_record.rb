require 'dicom'
include DICOM

class PatientRecord < ApplicationRecord
  has_one_attached :dicom

  # If the record has the tag, return it
  # Otherwise, return nil
  def get_tag_value(tag)
    dcm = DObject.read(self.dicom)
    unless dcm[tag].nil?
      return dcm[tag].value
    else
      return nil
    end
  end
end
