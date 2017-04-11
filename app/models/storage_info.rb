class StorageInfo < ActiveRecord::Base
    belongs_to :storage
    belongs_to :storage_allocation
end
