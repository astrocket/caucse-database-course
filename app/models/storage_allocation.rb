class StorageAllocation < ActiveRecord::Base
  belongs_to :service
  
  has_one :storage_info
  has_one :storage, through: :storage_info
end
