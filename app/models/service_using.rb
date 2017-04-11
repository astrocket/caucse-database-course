class ServiceUsing < ActiveRecord::Base
    has_many :box_infos
    has_many :storage_allocations
end
