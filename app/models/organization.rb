class Organization < ActiveRecord::Base
  belongs_to :prefecture
  enum category: %w(etcetera column interview news)

  #carrierwave
  mount_uploader :thumbnail, OrganizationImageUploader
end
