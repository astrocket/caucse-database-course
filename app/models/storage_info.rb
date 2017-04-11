class StorageInfo < ActiveRecord::Base
    belongs_to :storage
    has_many :storage_allocations
end
