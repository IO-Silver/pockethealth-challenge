require 'tempfile'
require 'dicom'
# require 'rmagick' # I was unable to install this due to compatibility issues with my laptop :(
include DICOM

class PatientRecord < ApplicationRecord
  has_one_attached :dicom

  # If the record has the tag, return it
  # Otherwise, return nil
  def get_tag_value(tag)
    dcm = instantiate_dcm
    unless dcm[tag].nil?
      # Rails doesn't like rendering numbers
      return dcm[tag].value
    else
      return nil
    end
  end

  # Unfortunately I could not test this feature (see README)
  def get_image
    # dcm = instantiate_dcm
    # image = dcm.image
    # if image
    #   response = Tempfile.new(UUID4.new + '.png')
    #   image.normalize.write(response)
    #   return response
    # else
    #   return nil
    # end
  end

  def get_dicom_path
    ActiveStorage::Blob.service.path_for(dicom.key)
  end

  def instantiate_dcm
    DObject.read(get_dicom_path)
  end
end
