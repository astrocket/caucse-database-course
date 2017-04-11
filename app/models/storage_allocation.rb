class StorageAllocation < ActiveRecord::Base
  belongs_to :service_using
  belongs_to :storage_info
end
